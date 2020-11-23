Description
===========

The goal is to provide simple scripts to install an amd64 Debian buster in qemu image
from an install with PXE and a preseed.

Dependencies
============


```
$ apt install qemu-utils qemu-system-x86 qemu-kvm curl python3
```

Technical
=========

1. The `build_qemu_debian_image.sh` script will create a temporary directory and generate password
1. Create a Simple webserver to serve the preseed.cfg file (not need to tftp)
1. Download netboot.tar.gz from Debian repo
1. Create the pxe configuration
1. Create the qemu image
1. Boot using the qemu image, pxe and preseed


`boot.sh` will boot on the newly created image.


Credits
=======

This is a fork from to make it work on Debian:

* https://sigmaris.info/blog/2019/04/automating-debian-install-qemu/
* https://gist.github.com/sigmaris/dc1883f782d1ff5d74252bebf852ec50


Known error
===========

If you get the following error:
```
No kernel modules were found. This probably is due to a mismatch between the
kernel used by this version of the installer and the kernel version available
in the archive.
```
It is caused by a mismatch between the kernel used in the installer
and the package not available on the repository.
Use https://d-i.debian.org/daily-images/ instead.
