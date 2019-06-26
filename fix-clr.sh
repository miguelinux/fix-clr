#!/bin/bash
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh
#
# Copyright (C) 2019 Intel Corporation
# 
# SPDX-License-Identifier: GPL-3.0-or-later
#

CL_ROOTFS=${1-/dev/sda3}
MOUNT_POINT=/mnt/my-cl

sudo mkdir ${MOUNT_POINT}
sudo mount ${CL_ROOTFS} ${MOUNT_POINT}
sudo mkdir -p  ${MOUNT_POINT}/var/lib/swupd
sudo chmod 700 ${MOUNT_POINT}/var/lib/swupd

# Get VERSION_ID from
source ${MOUNT_POINT}/usr/lib/os-release

sudo swupd repair --picky --version=${VERSION_ID} --path=${MOUNT_POINT} --statedir ${MOUNT_POINT}/var/lib/swupd

sudo umount ${MOUNT_POINT}
sudo rmdir  ${MOUNT_POINT}
