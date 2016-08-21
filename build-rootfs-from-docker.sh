#!/bin/bash
while (($#)); do 
  TAR=$(echo $1|sed 's/:/-/g').tar
  echo "Pulling distro $1 from docker registry"
  docker pull $1
  echo "Creating docker container from $1"
  ID=$(docker create $1 /bin/bash -l)
  echo "Exporting docker container $ID to $TAR ..."
  docker export -o "$TAR" "$ID"
  echo "Compressing $TAR ..."
  bzip2 $TAR
  echo "Generating hashes for ${TAR}.bz2"
  md5sum ${TAR}.bz2 > ${TAR}.bz2.md5
  sha1sum ${TAR}.bz2 > ${TAR}.bz2.sha1
  sha256sum ${TAR}.bz2 > ${TAR}.bz2.sha256
  echo "${TAR}.bz2 built"
  shift
done
