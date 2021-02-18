# Fuzzing

## Payload

https://github.com/alienwhatever/Admin-Scanner.git
https://github.com/swisskyrepo/PayloadsAllTheThings.git
https://github.com/ppbibo/PentesterSpecialDict.git
https://github.com/danielmiessler/RobotsDisallowed.git
https://github.com/danielmiessler/SecLists.git
https://github.com/assetnote/commonspeak2-wordlists.git
https://github.com/fuzzdb-project/fuzzdb.git
https://github.com/danielmiessler/RobotsDisallowed.git

## Worker

`fuzz.sh payloads/RobotsDisallowed/curated.txt https://target.website/FUZZ`

```
#!/usr/bin/env bash

set -x
set -o errexit
set -o nounset
set -o pipefail

LIST=${2}
TARGET=${1}

sudo ulimit -H -n 64000
sudo ulimit -S -n 64000
sudo ulimit -u unlimited

sudo \
  nice -10 \
  python -m \
  wfuzz \
  --hc 404,429,500 --follow -Z -c -L \
  -t 16 \
  -z file,"$LIST" \
  -XGET $TARGET
```
