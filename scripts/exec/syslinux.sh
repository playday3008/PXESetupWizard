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
ln -s $TFTP_PATH/syslinux/modules/$TRG_NME/* $TFTP_PATH/syslinux/

# Remove existing symlinks
[ -L $TFTP_PATH/pxelinux.0 ] && rm $TFTP_PATH/pxelinux.0
[ -L $TFTP_PATH/pxelinux ] && rm $TFTP_PATH/pxelinux

# Creating new ones
ln -s ../../syslinux/pxelinux.0 ../../pxelinux.0
ln -s ../../pxelinux.0 ../../pxelinux

. ./common/clean.sh
