#!/usr/bin/env bash

set -euox pipefail

# Install build dependencies
dnf install -y golang gpgme-devel libassuan-devel git
# Build the binary
export GOPATH=/go
mkdir -p $GOPATH
go install github.com/maximbaz/yubikey-touch-detector@latest
mkdir -p /src
git clone https://github.com/maximbaz/yubikey-touch-detector.git /src/yubikey-touch-detector
mkdir -p /out/ytd/bin /out/ytd/systemd
cp $GOPATH/bin/yubikey-touch-detector /out/ytd/bin/
cp /src/yubikey-touch-detector/yubikey-touch-detector.{service,socket} /out/ytd/systemd/
