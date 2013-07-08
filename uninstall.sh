#!/bin/sh

# Halt on errors
set -e

# DESTDIR provides a configurable system root to support RPM
# builds. Default is just an empty string.

rm -f \
  ${DESTDIR}/etc/init.d/log-previous-power-state \
  ${DESTDIR}/usr/bin/restore-previous-power-state \
  ${DESTDIR}/etc/pm/sleep.d/00log-previous-power-state
