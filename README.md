# pspdev-docker

## What does this do?
This program will automatically build a docker image with the pspdev toolchain ready to be used for homebrew development.

## How do I build it?

#### Build the image:
`sudo docker build -t pspdev-docker .`

#### Copy the helper script:
`sudo cp pspdev-docker /usr/local/bin`

## How do I use it?

#### Use the helper script to run commands in the current directory:
`pspdev-docker make`

## How do I save and load it?

#### Save the image:
`sudo docker save pspdev-docker | bzip2 > pspdev-docker.tar.bz2`

#### Load the image:
`sudo docker load < bzip2 -dc pspdev-docker.tar.bz2`

## How do I remove it?

#### Remove the image:
`sudo docker rmi pspdev-docker`

#### Remove the helper script:
`sudo rm /usr/local/bin/pspdev-docker`

# Docker Windows

Only follow these instructions if you use Docker Desktop on Windows (and not Linux like previously).

## How do I build it? Docker Desktop Edition (Windows)

#### Build the image:
In Command Line, `docker build -t pspdev-docker .`

## How do I use it?

Run this command in Command Line to build your homebrew
`docker run -v %cd%:/build --rm pspdev-docker make`
in the same folder your Makefile and source code is present.

## How do I save and load it?

#### Save the image:
`docker save pspdev-docker | bzip2 > pspdev-docker.tar.bz2`

#### Load the image:
`docker load < bzip2 -dc pspdev-docker.tar.bz2`
