 ====================
  What does this do?
 ====================

  This program will automatically build a docker image with the pspdev
  toolchain ready to be used for homebrew development.

 ====================
  How do I build it?
 ====================

 Build the image:

   docker build -t pspdev-docker .

 Copy the helper script:

   cp pspdev-docker.sh /usr/local/bin

 ==================
  How do I use it?
 ==================

 Use the helper script to run 'make' on the current directory:

   pspdev-docker.sh make

 Or, manually run 'make' on the current directory:

   docker run -v `pwd`:/build pspdev-docker make

 ============================
  How do I save and load it?
 ============================

 Save the image:

   docker save pspdev-docker | bzip2 > pspdev-docker.tar.bz2

 Load the image:

   docker load < bzip2 -dc pspdev-docker.tar.bz2
