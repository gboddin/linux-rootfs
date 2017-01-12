# linux-rootfs
Uses docker to build rootfs images from major linux distibution.

## Remarks

No docker is needed to run those images, standard chroot is all you need since docker is just used to build tarballs.

## Download rootfs tarballs

You can download pre-built rootfs tarball in the relase tab on this github project :

https://github.com/gboddin/linux-rootfs/releases/tag/latest

## Build your own

To build images yourself you will need docker installed on your machine.

```
git clone https://github.com/gboddin/linux-rootfs.git
cd linux-rootfs
./build-rootfs-from-docker.sh	debian:wheezy debian:sid debian:jessie ubuntu:vivid
```

### Update
2017-01-12 1600
