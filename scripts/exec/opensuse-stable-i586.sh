#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Temp paths and files
export SRC_PKG="https://download.opensuse.org/ports/i586/tumbleweed/iso/openSUSE-Tumbleweed-LegacyX86-NET-i586-Current.iso"
export TRG_NME="openSUSE-Tumbleweed-i586"
export TRG_PKG=$TRG_NME".iso"

# Download syslinux and deploy it
. ./common/download.sh
TRG_PATH=$TFTP_PATH/boot/$TRG_NME
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
cp -r $TMP/$TRG_PKG $TFTP_PATH/boot/$TRG_NME

# Clean
. ./common/clean.sh
