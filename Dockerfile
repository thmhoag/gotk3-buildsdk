FROM fedora:latest

RUN dnf -y update && \
    dnf -y install \
    file gcc make tar curl git boost boost-devel \
    mingw64-gcc mingw64-freetype freetype freetype-devel \
    mingw64-cairo mingw64-cairo-static cairo cairo-devel \
    mingw64-harfbuzz harfbuzz harfbuzz-devel \
    mingw64-pango pango pango-devel \
    mingw64-poppler poppler poppler-devel \
    mingw64-gtk3 gtk3 gtk3-devel \
    mingw64-glib2-static glib2 glib2-devel \
    atk atk-devel \
    mingw64-winpthreads mingw64-winpthreads-static

RUN curl -L -O https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz && \
    tar -xzf go1.12.6.linux-amd64.tar.gz && \
    mv go /usr/local && \
    mkdir /go

COPY peldd /usr/bin/peldd

ENV GOROOT=/usr/local/go
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

ENV PKG_CONFIG_ALLOW_CROSS=1
ENV PKG_CONFIG_PATH=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/pkgconfig/
ENV GTK_INSTALL_PATH=/usr/x86_64-w64-mingw32/sys-root/mingw/
