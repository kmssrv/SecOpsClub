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