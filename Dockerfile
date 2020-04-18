FROM ubuntu:latest
MAINTAINER Naomi Peori <naomi@peori.ca>

WORKDIR /build
ENV DEBIAN_FRONTEND="noninteractive"

ENV PSPDEV /usr/local/pspdev
ENV PATH ${PATH}:${PSPDEV}/bin

RUN \
  apt-get -y update && \
  apt-get -y install autoconf automake bison cmake doxygen flex g++ gcc git libelf-dev libgmp-dev libmpfr-dev libncurses5-dev libreadline-dev libsdl1.2-dev libtool-bin libusb-dev make mpc patch subversion tcl texinfo unzip wget && \
  apt-get -y clean autoclean autoremove && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

SHELL ["/bin/bash", "-c"]

RUN \
  git clone https://github.com/pspdev/psptoolchain.git && \
  pushd psptoolchain && \
    ./toolchain.sh && \
    popd && \
  rm -Rf psptoolchain
