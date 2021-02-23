```
#!/usr/bin/env bash

brew install jq fd xmllint pipenv

GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
GO111MODULE=on go get -v github.com/projectdiscovery/dnsx/cmd/dnsx
GO111MODULE=on go get -v github.com/projectdiscovery/shuffledns/cmd/shuffledns
GO111MODULE=on go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu
GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei

python3 -m pip install --user wfuzz dorkbot

mkdir -p tools

cd tools || true

pipenv install
pipenv shell

git clone https://github.com/BishopFox/GitGot.git GitGot
git clone https://github.com/soxoj/telegram-bot-dumper.git

```

```
echo "\n\nInstalled versions:\n" && \
  subfinder -version && \
  dnsx -version && \
  shuffledns -version && \
  naabu -version && \
  httpx -version && \
  nuclei -version && \
  wfuzz --version && \
  dorkbot --version
```
