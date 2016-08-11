#!/bin/bash
while (($#)); do 
  TAR=$(echo $1|sed 's/:/-/g').tar
  docker pull $1
  ID=$(docker create $1)
  docker export -o "$TAR" "$ID"
  bzip2 $TAR
  md5sum ${TAR}.bz2 > ${TAR}.bz2.md5
  sha1sum ${TAR}.bz2 > ${TAR}.bz2.sha1
  sha256sum ${TAR}.bz2 > ${TAR}.bz2.sha256
  shift
done
