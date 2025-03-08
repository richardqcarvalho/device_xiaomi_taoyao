#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/taoyao

TARGET_BOOTLOADER_BOARD_NAME := taoyao

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/hidl/vendor_framework_compatibility_matrix.xml \
    $(DEVICE_PATH)/hidl/xiaomi_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/hidl/manifest_lahaina.xml \
    $(DEVICE_PATH)/hidl/manifest_xiaomi.xml \
    $(DEVICE_PATH)/hidl/manifest_taoyao.xml

# Kernel
TARGET_KERNEL_NO_GCC := false
TARGET_KERNEL_SOURCE := kernel/xiaomi/taoyao
TARGET_KERNEL_CONFIG := vendor/taoyao-qgki_defconfig
TARGET_KERNEL_LLVM_BINUTILS := false
TARGET_KERNEL_CLANG_PATH := $(shell pwd)/prebuilts/clang/kernel/linux-x86/clang-r416183b
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/kernel-build-tools/linux-x86/bin/dtc
TARGET_KERNEL_ADDITIONAL_FLAGS += DTC_OVERLAY_TEST_EXT=$(shell pwd)/prebuilts/kernel-build-tools/linux-x86/bin/ufdt_apply_overlay
TARGET_KERNEL_ADDITIONAL_FLAGS += CONFIG_BUILD_ARM64_DT_OVERLAY=y
TARGET_KERNEL_ADDITIONAL_FLAGS += HOSTAR=$(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-ar
TARGET_KERNEL_ADDITIONAL_FLAGS += HOSTLD=$(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-ld
TARGET_KERNEL_ADDITIONAL_FLAGS += REAL_CC=$(TARGET_KERNEL_CLANG_PATH)/bin/clang
TARGET_KERNEL_ADDITIONAL_FLAGS += LLVM_NM=$(TARGET_KERNEL_CLANG_PATH)/bin/llvm-nm
TARGET_KERNEL_ADDITIONAL_FLAGS += NM=$(TARGET_KERNEL_CLANG_PATH)/bin/llvm-nm

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
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 120

# Include proprietary files
include vendor/xiaomi/taoyao/BoardConfigVendor.mk
