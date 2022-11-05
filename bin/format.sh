#!/usr/bin/env bash
# https://sharats.me/posts/shell-script-best-practices/

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./format.sh'
    exit
fi

DIR=`dirname "$0"`
pushd "$DIR/.." &>/dev/null

if command -v swiftformat >/dev/null 2>&1; then
  swiftformat --quiet --config .swiftformat .
else
  echo "warning: Install swiftformat by running 'brew install swiftformat'" >&2
fi

popd &>/dev/null
