#!/bin/sh -x

set -e

SRCDIR=`pwd`
cd /home/user
cp -r $SRCDIR ./
cd "${CI_PROJECT_NAME}"
meson setup --localstatedir /var -Db_coverage=true _build
# FIXME until we can figure out how to depend on mocklibc being built for the tests
meson compile -C _build
VALGRIND=1 meson test -C _build -v --print-errorlogs --no-stdsplit --timeout-multiplier 100
ninja -C _build coverage
