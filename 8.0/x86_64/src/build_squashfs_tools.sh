#!/bin/sh

apk add --no-cache squashfs-tools 1>&2

if [ ! -f squashfs-tools.tcz ]; then
    wget http://tinycorelinux.net/8.x/x86_64/tcz/squashfs-tools.tcz 1>&2
fi

[ -d /mnt ] || mkdir /mnt
unsquashfs -f -d /mnt squashfs-tools.tcz 1>&2
tar cf - -C /mnt . | gzip -c
