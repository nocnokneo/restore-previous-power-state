#!/bin/sh

# Halt on errors
set -e

# DESTDIR provides a configurable system root to support RPM
# builds. Default is just an empty string.

install -m 755 -d \
    ${DESTDIR}/usr/bin \
    ${DESTDIR}/etc/init.d \
    ${DESTDIR}/etc/pm/sleep.d \
    ${DESTDIR}/var/lib/pm-utils

install -pm 755 restore-previous-power-state ${DESTDIR}/usr/bin/
install -pm 755 log-previous-power-state ${DESTDIR}/etc/init.d/
ln -s ../../init.d/log-previous-power-state ${DESTDIR}/etc/pm/sleep.d/00log-previous-power-state

# Initialize the previous state for first use
mkdir -p ${DESTDIR}/var/lib/pm-utils
echo off > ${DESTDIR}/var/lib/pm-utils/previous_state
