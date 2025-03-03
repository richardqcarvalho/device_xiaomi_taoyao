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

TARGET_NO_KERNEL_OVERRIDE := true
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_SEPARATED_DTBO := false
BOARD_PREBUILT_DTBOIMAGE := $(INSTALLED_DTBIMAGE_TARGET)
TARGET_KERNEL_SOURCE := kernel/xiaomi/taoyao
VENDOR_RAMDISK_KERNEL_MODULES := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(KERNEL_MODULES_OUT)/msm_drm.ko
KERNEL_DEFCONFIG := vendor/taoyao-qgki_defconfig
BOARD_KERNEL_BINARIES := kernel kernel-gki
TARGET_KERNEL_VERSION := 5.4
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_USES_UNCOMPRESSED_KERNEL := false

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
