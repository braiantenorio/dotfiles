#!/bin/bash


VERSION=$(curl -s https://go.dev/VERSION?m=text | head -n 1)

wget https://go.dev/dl/$VERSION.linux-amd64.tar.gz

tar xvfz $VERSION.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo mv go /usr/local/

go install golang.org/x/tools/cmd/goimports@latest
go install github.com/nsf/gocode@latest

rm $VERSION.linux-amd64.tar.gz
