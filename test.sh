#!/bin/sh -eu

prefix="/usr/local"

if [ "${PREFIX:-}" != "" ] ; then
  prefix=${PREFIX:-}
elif [ "${BOXEN_HOME:-}" != "" ] ; then
  prefix=${BOXEN_HOME:-}
fi

rm -rf $prefix/bin/git-lfs*
for g in git*; do
  install -D $g "$prefix/bin/$g"
done

PATH+=:$prefix/bin
git lfs init

