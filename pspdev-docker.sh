#!/bin/sh

if [ ! -z "$*" ]; then
  docker run -v `pwd`:/build pspdev-docker $*
fi
