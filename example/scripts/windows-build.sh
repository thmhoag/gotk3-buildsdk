#!/usr/bin/env bash

export PKG_CONFIG_PATH=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/pkgconfig
export GOOS=windows
export GOARCH=amd64
export CGO_ENABLED=1
export CXX=x86_64-w64-mingw32-g++
export CC=x86_64-w64-mingw32-gcc
export CGO_LDFLAGS_ALLOW=.*

[ -d dist/windows ] && rm -rf dist/windows

mkdir -p dist/windows
cd dist/windows

mkdir -p share/glib-2.0
cp -r $GTK_INSTALL_PATH/share/glib-2.0/schemas share/glib-2.0
cp -r $GTK_INSTALL_PATH/share/icons share
cp $GTK_INSTALL_PATH/bin/{iconv.dll,libatk-1.0-0.dll,libbz2-1.dll,libcairo-2.dll,libcairo-gobject-2.dll,libepoxy-0.dll,libexpat-1.dll,libffi-6.dll,libfontconfig-1.dll,libfreetype-6.dll,libgcc_s_seh-1.dll,libgdk-3-0.dll,libgdk_pixbuf-2.0-0.dll,libgio-2.0-0.dll,libgit2.dll,libglib-2.0-0.dll,libgmodule-2.0-0.dll,libgobject-2.0-0.dll,libgraphite2.dll,libgtk-3-0.dll,libharfbuzz-0.dll,libiconv-2.dll,libintl-8.dll,libjasper-1.dll,libjpeg-8.dll,libpango-1.0-0.dll,libpangocairo-1.0-0.dll,libpangoft2-1.0-0.dll,libpangowin32-1.0-0.dll,libpcre-1.dll,libpixman-1-0.dll,libpng16-16.dll,libstdc++-6.dll,libwinpthread-1.dll,zlib1.dll} .

cd ../..
go build -ldflags -H=windowsgui -o dist/windows/example.exe
cp -r ./ui dist/windows/