#!/bin/sh -x

SRCDIR=`pwd`
cd /home/user
cp -r $SRCDIR ./
cd accountsservice
meson setup --localstatedir /var -Db_coverage=true _build
# FIXME until we can figure out how to depend on mocklibc being built for the tests
meson compile -C _build
meson test -C _build --print-errorlogs --no-stdsplit --timeout-multiplier 3
ninja -C _build coverage
