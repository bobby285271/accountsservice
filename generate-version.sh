#!/bin/sh
VERSION_FROM_DIR_NAME=$(dirname $PWD/.. | sed -n 's/^.*-\([^-]*\)$/\1/p')

if [ -n "$VERSION_FROM_DIR_NAME" ]; then
    echo "$VERSION_FROM_DIR_NAME"
    exit 0
fi

COMMITS_SINCE_LAST_RELEASE=$(git rev-list $(git describe --abbrev=0)..HEAD --count)
date +%y.%V.${COMMITS_SINCE_LAST_RELEASE} -d "@$(git log -1 --pretty=format:%ct)"

