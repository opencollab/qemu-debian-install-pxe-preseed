#!/bin/sh

DISTRO=buster
if test $# -eq 1; then
    DISTRO=$1
fi

qemu-system-x86_64 \
	-hda debian-$DISTRO.qcow \
        -smp $(nproc) \
	-netdev user,id=net0,net=10.0.2.0/24,hostname=bustervm,domainname=localdomain \
	-device e1000,netdev=net0,mac=52:54:98:76:54:32 \
	-boot once=n \
	-m 2048 \
	-nographic \
	-enable-kvm
