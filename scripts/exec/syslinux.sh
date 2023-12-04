#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Remove existing symlinks
rm -rf $TFTP_PATH/syslinux/*

# Use local syslinux and deploy it
cp -r /usr/lib/syslinux/* $TFTP_PATH/syslinux/
cp -r /usr/lib/PXELINUX/* $TFTP_PATH/syslinux/

# Use bios folder as default
TRG_NME="bios"
# For each file in syslinux/modules/$TRG_NME create a symlink in syslinux
for file in $TFTP_PATH/syslinux/modules/$TRG_NME/*; do
    ln -s modules/$TRG_NME/$(basename $file) ../../syslinux/$(basename $file)
done

# Remove existing symlinks
[ -L $TFTP_PATH/pxelinux.0 ] && rm $TFTP_PATH/pxelinux.0
[ -L $TFTP_PATH/pxelinux ] && rm $TFTP_PATH/pxelinux

# Creating new ones
ln -s syslinux/pxelinux.0 ../../pxelinux.0
ln -s pxelinux.0 ../../pxelinux

. ./common/clean.sh
