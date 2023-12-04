#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Remove existing symlinks
rm -rf $TFTP_PATH/syslinux/*

# Use local syslinux and deploy it
ln -s /usr/lib/syslinux/* $TFTP_PATH/syslinux/
ln -s /usr/lib/PXELINUX/* $TFTP_PATH/syslinux/

# Creating new ones
ln -s $TFTP_PATH/$TRG_NME/pxelinux.0 $TFTP_PATH/pxelinux.0
ln -s $TFTP_PATH/pxelinux.0 $TFTP_PATH/pxelinux

. ./common/clean.sh
