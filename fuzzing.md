# Fuzzing

## Payload

— https://github.com/alienwhatever/Admin-Scanner

— https://github.com/swisskyrepo/PayloadsAllTheThings

— https://github.com/ppbibo/PentesterSpecialDict

— https://github.com/danielmiessler/RobotsDisallowed

— https://github.com/danielmiessler/SecLists

— https://github.com/assetnote/commonspeak2-wordlists

— https://github.com/fuzzdb-project/fuzzdb

— https://github.com/danielmiessler/RobotsDisallowed

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
