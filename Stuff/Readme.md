# How to shrink /home and extend /root in XFS File System using LVM
## Bad news
XFS File System does not support shrinking in 2023.
## Good news
But we can:
1. **Backup all data in /home.**
2. **Remove /home.**
3. **Create /home with the new desirable space.**
4. **Restore all data back to /home.**
5. **Extend /root in a common way.**
## Lets do it
### Environment
Oracle Linux 8.6 with LVM setup
### Before
```
df -h
Filesystem           Size  Used Avail Use% Mounted on
devtmpfs             828M     0  828M   0% /dev
tmpfs                847M     0  847M   0% /dev/shm
tmpfs                847M   17M  831M   2% /run
tmpfs                847M     0  847M   0% /sys/fs/cgroup
/dev/mapper/ol-root  4.7G  2.4G  2.4G  50% /
/dev/mapper/ol-home  4.7G   66M  4.6G   2% /home
/dev/sda2           1014M  257M  758M  26% /boot
/dev/sda1            599M  5.1M  594M   1% /boot/efi
tmpfs                170M     0  170M   0% /run/user/0
```
### Create a temporary directory
`mkdir /temp`
### Backup all data in /home
Copy data from /home to /temp. Preserves the ownership, timestamps, symbolic links, and permissions while copying files and directories.

`cp -a /home/ /temp`
### Unmount /home
`umount /home`
### Remove the logical volume
**Check LV name**
```
lvs
LV   VG Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
home ol -wi-a----- 4.66g
root ol -wi-ao---- 4.66g
swap ol -wi-ao---- 1.60g
```

**Remove LV home**

`lvremove /dev/ol/home`

You may get error "Logical volume ol/home contains a filesystem in use. Cannot deactivate logical volume ol/home". The error message you're seeing indicates that the logical volume `ol/home` contains a filesystem that is currently in use, and therefore, the logical volume cannot be deactivated or removed.

To resolve this issue, you need to ensure that the filesystem on the logical volume is unmounted before you attempt to remove the logical volume. Follow these steps:

**Find out what is using the filesystem:** First, determine which processes are using the filesystem on the logical volume. You can use the `lsof` command to find out which processes have open files on the logical volume. For example:
`lsof /dev/ol/home`

This will show you the processes and files that are currently using the logical volume.

**Unmount the filesystem:** If you find that processes are using the filesystem, you need to unmount it. Use the `umount` command:
`umount /dev/ol/home`

This command unmounts the filesystem, allowing you to proceed with deactivating or removing the logical volume.

Now try to remove logical volume once again

`lvremove /dev/ol/home`
### Recreate the LV with the desired size
```
lvcreate -L 1G -n home ol
WARNING: xfs signature detected on /dev/ol/home at offset 0. Wipe it? [y/n]: y
Wiping xfs signature on /dev/ol/home.
Logical volume "home" created.
```

### Format the new home LV with XFS
```
mkfs.xfs /dev/ol/home
meta-data=/dev/ol/home           isize=512    agcount=4, agsize=65536 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=1, rmapbt=0
         =                       reflink=1    bigtime=0 inobtcount=0
data     =                       bsize=4096   blocks=262144, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
```

### Mount the resized /home
`mount /dev/ol/home /home/`

### Extend /root
```
lvextend -l+100%FREE /dev/ol/root
xfs_growfs /dev/mapper/ol-root
```

### Rebuild the initramfs files
`dracut --regenerate-all --force`
### Restore data from the temporary directory to /home
`cp -a /temp/home/ /`

### After
```
df -h
Filesystem           Size  Used Avail Use% Mounted on
devtmpfs             828M     0  828M   0% /dev
tmpfs                847M     0  847M   0% /dev/shm
tmpfs                847M   17M  831M   2% /run
tmpfs                847M     0  847M   0% /sys/fs/cgroup
/dev/mapper/ol-root  8.4G  2.4G  6.0G  29% /
/dev/sda2           1014M  256M  759M  26% /boot
/dev/sda1            599M  5.1M  594M   1% /boot/efi
tmpfs                170M     0  170M   0% /run/user/0
/dev/mapper/ol-home 1014M   66M  975M   4% /home
```