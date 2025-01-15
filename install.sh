#!/bin/sh
set -eo pipefail

PLATFORM="linux"
ARCH="x64"
NAME="Fastmail"
DIR="${NAME}-${PLATFORM}-${ARCH}"

if [ ! -d "$DIR" ] ; then
  echo "Build the app first!"
  exit 1
fi

if [ "$EUID" -ne 0 ] ; then
  echo "Run this script as root!"
  exit 1
fi

rm -rf /opt/$DIR
mv $DIR /opt
chown -R root:root /opt/$DIR
