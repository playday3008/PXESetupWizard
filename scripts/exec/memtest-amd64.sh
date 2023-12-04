#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Version of memtest
MT_VER="mt86plus_6.20"

# Temp paths and files
export SRC_PKG="https://www.memtest.org/download/v6.20/"$MT_VER".binaries.zip"
export TRG_NME="memtest64"
export TRG_PKG=$TRG_NME".binaries.zip"

# Create tmp path
. ./common/download.sh
unzip $TMP/$TRG_PKG
[ ! -d $TFTP_PATH/boot/memtest ] && mkdir $TFTP_PATH/boot/memtest
mv $TMP/$TRG_NME".bin" $TFTP_PATH/boot/memtest/memtest

. ./common/clean.sh
