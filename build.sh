#!/bin/sh

PLATFORM="linux"
ARCH="x64"
NAME="Fastmail"
DIR="${NAME}-${PLATFORM}-${ARCH}"

nativefier https://www.fastmail.com/mail/ --name ${NAME} --inject fastmail.css

# Change package name from 'fastmail-nativefier-XXXXXX' to 'Fastmail'
sed -i -E "s/fastmail-nativefier-.{6}/${NAME}/" ${DIR}/resources/app/package.json

# Fix permissions
find ${DIR} -type f -exec chmod go+r {} \;
find ${DIR} -type d -exec chmod go+rx {} \;
