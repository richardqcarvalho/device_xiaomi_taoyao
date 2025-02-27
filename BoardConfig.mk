#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/taoyao
#BUILD_BROKEN_ELF_PREBUILT__COPY_FILES := true
#BUILD_BROKEN_DUP_RULES := true

TARGET_BOOTLOADER_BOARD_NAME := taoyao

# Screen density
TARGET_SCREEN_DENSITY := 400

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/hidl/manifest.xml

TARGET_KERNEL_CONFIG += vendor/taoyao_QGKI.config

# NFC
TARGET_USES_NQ_NFC := true

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 16777216

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 120

# Include proprietary files
include vendor/xiaomi/taoyao/BoardConfigVendor.mk
