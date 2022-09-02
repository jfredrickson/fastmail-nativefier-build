#!/bin/sh

PLATFORM="linux"
ARCH="x64"
NAME="Fastmail"

nativefier https://www.fastmail.com/mail/ --name ${NAME} --inject fastmail.css

# Change package name from 'fastmail-nativefier-XXXXXX' to 'Fastmail'
sed -i -E "s/fastmail-nativefier-.{6}/${NAME}/" ${NAME}-${PLATFORM}-${ARCH}/resources/app/package.json

