#!/usr/bin/env bash

set -x
set -e

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`

SUBFINDER_VERSION="2.4.8"
HTTPX_VERSION="1.0.9"
NUCLEI_VERSION="2.3.7"
NUCLEI_TEMPLATES_VERSION="8.3.3"
AQUATONE_VERSION="1.7.0"

cd "${SCRIPTPATH}"

go mod download

gox -osarch="linux/amd64" -output="${SCRIPTPATH}" github.com/cgboal/sonarsearch/crobat
gox -osarch="linux/amd64" -output="${SCRIPTPATH}" github.com/hakluke/hakrawler

# subfinder

curl -sL -o "${SCRIPTPATH}/subfinder.tar.gz" \
  "https://github.com/projectdiscovery/subfinder/releases/download/v${SUBFINDER_VERSION}/subfinder_${SUBFINDER_VERSION}_linux_amd64.tar.gz"
  
tar -zxf "${SCRIPTPATH}/subfinder.tar.gz" --directory "${SCRIPTPATH}" && rm -f "${SCRIPTPATH}/subfinder.tar.gz"

# httpx

git clone https://github.com/projectdiscovery/httpx.git "${SCRIPTPATH}/httpx_git" \
  && cd httpx_git/cmd/httpx \
  && go build \
  && gox -osarch="linux/amd64" -output="${SCRIPTPATH}" . \
  && cd "${SCRIPTPATH}"
  
rm -rf "${SCRIPTPATH}/httpx_git"

# dnsx

git clone https://github.com/projectdiscovery/dnsx.git "${SCRIPTPATH}/dnsx_git" \
  && cd dnsx_git/cmd/dnsx \
  && go build \
  && gox -osarch="linux/amd64" -output="${SCRIPTPATH}" . \
  && cd "${SCRIPTPATH}"
  
rm -rf "${SCRIPTPATH}/dnsx_git"
