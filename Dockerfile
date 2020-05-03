FROM ubuntu:latest
MAINTAINER Naomi Peori <naomi@peori.ca>

WORKDIR /build
ENV DEBIAN_FRONTEND="noninteractive"

ENV PSPDEV /usr/local/pspdev
ENV PATH ${PATH}:${PSPDEV}/bin

RUN \
  apt-get -y update && \
  apt-get -y install autoconf automake bison bzip2 cmake doxygen flex g++ gcc git gzip libarchive-dev libcurl4-openssl-dev libelf-dev libncurses5-dev libreadline-dev libssl-dev libtool-bin libusb-dev make patch pkg-config subversion tar tcl texinfo unzip wget xz-utils && \
  apt-get -y clean autoclean autoremove && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

SHELL ["/bin/bash", "-c"]

RUN \
  git clone https://github.com/pspdev/psptoolchain.git && \
  pushd psptoolchain && \
    ./toolchain.sh && \
    popd && \
  rm -Rf psptoolchain
