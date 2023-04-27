# Newly registred domains (NRDs)
## Overwiew
Threat actors often prefer to use newly registered domains (NRDs) as a means to launch malicious campaigns. As a best security practice, it is recommended to block or closely monitor NRDs in enterprise traffic.

## Usage
### Kaspersky CyberTrace
[nrd-list-downloader](https://github.com/kmssrv/nrd-list-downloader)  is a shell script that automatically downloads, decompresses, and aggregates Newly Registered Domain (NRD) lists from [WhoisDS.com](https://www.whoisds.com/newly-registered-domains). Script generates a clean .csv file that is formatted for use with Kaspersky CyberTrace.

## References

### Newly Registered Domains: Malicious Abuse by Bad Actors - Unit 42 - Palo Alto Networks
https://unit42.paloaltonetworks.com/newly-registered-domains-malicious-abuse-by-bad-actors/

# Top 1 million domains
## Overview
Communicating with not commonly known domains is not a point to compromise, but monitoring these kinds of domains can provide additional context through correlation with other more important events.

## Sources
Majestic
-   Download page: [https://majestic.com/reports/majestic-million](https://majestic.com/reports/majestic-million)
-   Download link: [https://downloads.majestic.com/majestic_million.csv](https://downloads.majestic.com/majestic_million.csv)

## Usage
### Kaspersky CyberTrace
[Majestic million .csv](https://downloads.majestic.com/majestic_million.csv) file is formatted for use with Kaspersky CyberTrace.
You can use a simple shell script added to cron to download the feed automatically:
`curl -k https://downloads.majestic.com/majestic_million.csv >> majestic_million.csv` 

### KUMA 2.1
Commonly you need to use some inverse correlation rule like `If not TIDetect feed majestic_million_URL contains record found by DestinationHostName` 

Examples of enrichment and correlation rules are available.

**_NOTE:_**  KUMA resources password is Kmssrv!1

`