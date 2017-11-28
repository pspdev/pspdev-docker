#!/bin/sh

if [ ! -z "$1" ]; then
  docker run -v `pwd`:/build pspdev-docker $1
fi
