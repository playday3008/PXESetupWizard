#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Temp paths and files
REL="1.5.0-6"
ARCH="amd64"
export SRC_PKG="http://downloads.sourceforge.net/project/gparted/gparted-live-stable/${REL}/gparted-live-${REL}-${ARCH}.zip"
export TRG_NME="gparted-${ARCH}"
export TRG_PKG=$TRG_NME".zip"

# Download and deploy it
. ./common/download.sh
unzip $TMP/$TRG_PKG -d $TFTP_PATH/boot/$TRG_NME
. ./common/clean.sh
