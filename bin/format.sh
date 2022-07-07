#!/usr/bin/env bash

set -e

SELF=`realpath $0`
DIR=`dirname $SELF`
DEV_DIR=`echo ${DIR%/*}`

pushd "$DEV_DIR" &>/dev/null

if command -v swiftformat >/dev/null 2>&1; then
  swiftformat --quiet --config .swiftformat .
else
  echo "warning: Install swiftformat by running 'brew install swiftformat'"
fi

popd &>/dev/null
