#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/taoyao

TARGET_BOOTLOADER_BOARD_NAME := taoyao

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

TARGET_USES_GRALLOC4 := true
TARGET_USES_HWC2 := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/hidl/vendor_framework_compatibility_matrix.xml \
    $(DEVICE_PATH)/hidl/xiaomi_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/hidl/manifest_lahaina.xml \
    $(DEVICE_PATH)/hidl/manifest_xiaomi.xml \
    $(DEVICE_PATH)/hidl/manifest_taoyao.xml

TARGET_KERNEL_CONFIG += vendor/taoyao_QGKI.config
TARGET_KERNEL_CLANG_PATH := $(shell pwd)/prebuilts-master/clang/host/linux-x86/clang-r383902b1

BOOT_KERNEL_MODULES := \
    msm_drm.ko \
    focaltech_touch.ko \
    goodix_core.ko \
    hwid.ko \
    xiaomi_touch.ko
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))

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

WIFI_DRIVER_DEFAULT := qca_cld3
CONFIG_ACS := true
CONFIG_IEEE80211AX := true
WIFI_FEATURE_HOSTAPD_11AX := true

# Include proprietary files
include vendor/xiaomi/taoyao/BoardConfigVendor.mk
