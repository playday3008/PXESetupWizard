#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Temp paths and files
OPENWRT_VNUM="23.05.2"
export SRC_PKG="https://downloads.openwrt.org/releases/${OPENWRT_VNUM}/targets/x86/64/openwrt-${OPENWRT_VNUM}-x86-64-generic-squashfs-combined.img.gz"
export TRG_NME="openwrt"
export TRG_PKG=$TRG_NME".img.gz"

# Download syslinux and deploy it
. ./common/download.sh
TRG_PATH=$TFTP_PATH/boot/$TRG_NME
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
gunzip -c $TMP/$TRG_PKG > $TFTP_PATH/boot/$TRG_NME/$TRG_NME".img"

# Clean
. ./common/clean.sh
