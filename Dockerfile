FROM ubuntu:latest
LABEL maintainer="Naomi Peori <naomi@peori.ca>"

WORKDIR /build
ENV DEBIAN_FRONTEND="noninteractive"

ENV PSPDEV /usr/local/pspdev
ENV PATH ${PATH}:${PSPDEV}/bin

RUN \
  apt-get -y update && \
  apt-get -y install autoconf automake bison bzip2 cmake curl doxygen fakeroot flex g++ gcc git gzip libarchive-dev libarchive-tools libcurl4 libcurl4-openssl-dev libelf-dev libgmp3-dev libgpgme-dev libmpc-dev libmpfr-dev libncurses5-dev libreadline-dev libssl-dev libtool-bin libusb-dev m4 make patch pkg-config python3 python3-pip python3-venv subversion sudo tar tcl texinfo unzip wget xz-utils && \
  apt-get -y clean autoclean autoremove && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

SHELL ["/bin/bash", "-c"]

# FIX: could not open file: /etc/mtab: No such file or directory on /scripts/003-psp-packages.sh
RUN ln -sf /proc/mounts /etc/mtab

RUN \
  git clone https://github.com/pspdev/pspdev.git && \
  pushd pspdev && \
    ./build-all.sh && \
    popd && \
  rm -Rf pspdev
