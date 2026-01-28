#!/bin/bash

source .bashrc
source .zshrc

VERSION=$(curl -s https://go.dev/VERSION?m=text)

wget https://go.dev/dl/go$VERSION.linux-amd64.tar.gz

#tar xvfz go$VERSION.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo mv go /usr/local/

go install golang.org/x/tools/cmd/goimports@latest
go install github.com/nsf/gocode@latest

rm go$VERSION.linux-amd64.tar.gz
