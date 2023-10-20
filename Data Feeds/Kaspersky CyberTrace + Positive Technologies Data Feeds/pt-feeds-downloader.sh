#!/bin/bash
curl -k 'https://cybsi.ptsecurity.com/api/feeds/short-lived-ips/1/json' -H 'Accept:application/vnd.ptsecurity.app-v1' -H "Authorization: Bearer $(curl -k  'https://cybsi.ptsecurity.com/auth/token?apiKey=v6RlbGDfSpGNbTVmd7xZC8i4eo52sZ6zN9TDPBeUB2I' |jq -r .accessToken)" -o /root/ptfeeds/pt-short-lived-ips.zip
unzip /root/ptfeeds/pt-short-lived-ips.zip -d /root/ptfeeds/
mv -f /root/ptfeeds/short-lived-ips_*.json /root/ptfeeds/pt-short-lived-ips.json
rm -f /root/ptfeeds/pt-short-lived-ips.zip
curl -k 'https://cybsi.ptsecurity.com/api/feeds/long-lived-ips/1/json' -H 'Accept:application/vnd.ptsecurity.app-v1' -H "Authorization: Bearer $(curl -k  'https://cybsi.ptsecurity.com/auth/token?apiKey=v6RlbGDfSpGNbTVmd7xZC8i4eo52sZ6zN9TDPBeUB2I' |jq -r .accessToken)" -o /root/ptfeeds/pt-long-lived-ips.zip
unzip /root/ptfeeds/pt-long-lived-ips.zip -d /root/ptfeeds/
mv -f /root/ptfeeds/long-lived-ips_*.json /root/ptfeeds/pt-long-lived-ips.json
rm -f /root/ptfeeds/pt-long-lived-ips.zip
curl -k 'https://cybsi.ptsecurity.com/api/feeds/long-lived-urls/1/json' -H 'Accept:application/vnd.ptsecurity.app-v1' -H "Authorization: Bearer $(curl -k  'https://cybsi.ptsecurity.com/auth/token?apiKey=v6RlbGDfSpGNbTVmd7xZC8i4eo52sZ6zN9TDPBeUB2I' |jq -r .accessToken)" -o /root/ptfeeds/pt-long-lived-urls.zip
unzip /root/ptfeeds/pt-long-lived-urls.zip -d /root/ptfeeds/
mv -f /root/ptfeeds/long-lived-urls_*.json /root/ptfeeds/pt-long-lived-urls.json
rm -f /root/ptfeeds/pt-long-lived-urls.zip
curl -k 'https://cybsi.ptsecurity.com/api/feeds/long-lived-hashes/1/json' -H 'Accept:application/vnd.ptsecurity.app-v1' -H "Authorization: Bearer $(curl -k  'https://cybsi.ptsecurity.com/auth/token?apiKey=v6RlbGDfSpGNbTVmd7xZC8i4eo52sZ6zN9TDPBeUB2I' |jq -r .accessToken)" -o /root/ptfeeds/pt-long-lived-hashes.zip
unzip /root/ptfeeds/pt-long-lived-hashes.zip -d /root/ptfeeds/
mv -f /root/ptfeeds/long-lived-hashes_*.json /root/ptfeeds/pt-long-lived-hashes.json
rm -f /root/ptfeeds/pt-long-lived-hashes.zip
curl -k 'https://cybsi.ptsecurity.com/api/feeds/short-lived-domains/1/json' -H 'Accept:application/vnd.ptsecurity.app-v1' -H "Authorization: Bearer $(curl -k  'https://cybsi.ptsecurity.com/auth/token?apiKey=v6RlbGDfSpGNbTVmd7xZC8i4eo52sZ6zN9TDPBeUB2I' |jq -r .accessToken)" -o /root/ptfeeds/pt-short-lived-domains.zip
unzip /root/ptfeeds/pt-short-lived-domains.zip -d /root/ptfeeds/
mv -f /root/ptfeeds/short-lived-domains_*.json /root/ptfeeds/pt-short-lived-domains.json
rm -f /root/ptfeeds/pt-short-lived-domains.zip
curl -k 'https://cybsi.ptsecurity.com/api/feeds/long-lived-domains/1/json' -H 'Accept:application/vnd.ptsecurity.app-v1' -H "Authorization: Bearer $(curl -k  'https://cybsi.ptsecurity.com/auth/token?apiKey=v6RlbGDfSpGNbTVmd7xZC8i4eo52sZ6zN9TDPBeUB2I' |jq -r .accessToken)" -o /root/ptfeeds/pt-long-lived-domains.zip
unzip /root/ptfeeds/pt-long-lived-domains.zip -d /root/ptfeeds/
mv -f /root/ptfeeds/long-lived-domains_*.json /root/ptfeeds/pt-long-lived-domains.json
rm -f /root/ptfeeds/pt-long-lived-domains.zip
curl -k 'https://cybsi.ptsecurity.com/api/feeds/short-lived-urls/1/json' -H 'Accept:application/vnd.ptsecurity.app-v1' -H "Authorization: Bearer $(curl -k  'https://cybsi.ptsecurity.com/auth/token?apiKey=v6RlbGDfSpGNbTVmd7xZC8i4eo52sZ6zN9TDPBeUB2I' |jq -r .accessToken)" -o /root/ptfeeds/pt-short-lived-urls.zip
unzip /root/ptfeeds/pt-short-lived-urls.zip -d /root/ptfeeds/
mv -f /root/ptfeeds/short-lived-urls_*.json /root/ptfeeds/pt-short-lived-urls.json
rm -f /root/ptfeeds/pt-short-lived-urls.zip
curl -k 'https://cybsi.ptsecurity.com/api/feeds/short-lived-hashes/1/json' -H 'Accept:application/vnd.ptsecurity.app-v1' -H "Authorization: Bearer $(curl -k  'https://cybsi.ptsecurity.com/auth/token?apiKey=v6RlbGDfSpGNbTVmd7xZC8i4eo52sZ6zN9TDPBeUB2I' |jq -r .accessToken)" -o /root/ptfeeds/pt-short-lived-hashes.zip
unzip /root/ptfeeds/pt-short-lived-hashes.zip -d /root/ptfeeds/
mv -f /root/ptfeeds/short-lived-hashes_*.json /root/ptfeeds/pt-short-lived-hashes.json
rm -f /root/ptfeeds/pt-short-lived-hashes.zip
