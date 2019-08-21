#!/usr/bin/env bash

export PKG_CONFIG_PATH=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/pkgconfig
export GOOS=linux
export GOARCH=amd64
export CGO_ENABLED=0
export CXX=x86_64-w64-mingw32-g++
export CC=x86_64-w64-mingw32-gcc
export CGO_LDFLAGS_ALLOW=.*

[ -d dist/linux ] && rm -rf dist/linux

mkdir -m 777 -p dist/linux
cd dist/linux

cd ../..
go mod download
go build --tags gtk_3_24 -o dist/linux/example
cp -r ./ui dist/linux