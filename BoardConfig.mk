#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

include build/make/target/board/BoardConfigMainlineCommon.mk

DEVICE_PATH := device/xiaomi/taoyao

BOARD_VENDOR := xiaomi

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_INCORRECT_PARTITION_IMAGES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := taoyao

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
BOARD_BOOT_HEADER_VERSION := 3
BOARD_KERNEL_BASE := 0x00000000

BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.memcg=1
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += swiotlb=0
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += cgroup.memory=nokmem,nosocket
BOARD_KERNEL_CMDLINE += pcie_ports=compat
BOARD_KERNEL_CMDLINE += iptable_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += ip6table_raw.raw_before_defrag=1

BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := taoyao_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/taoyao

TARGET_NO_KERNEL := false
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_RAMDISK_USE_LZ4 := true

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilts/dtb.img:$(TARGET_COPY_OUT)/dtb.img \
    $(DEVICE_PATH)/prebuilts/kernel:kernel

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_DTBOIMG_PARTITION_SIZE := 16777216
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10737418240
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    product \
    system_ext \
    vendor \
    odm
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_ODM := odm

TARGET_USES_MKE2FS := true

# Platform
TARGET_BOARD_PLATFORM := lahaina

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/properties/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/properties/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/properties/system_ext.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/properties/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# Recovery
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery.wipe
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.default
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true

# Security patch level
VENDOR_SECURITY_PATCH := 2024-07-05

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 2
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# VINTF
DEVICE_MANIFEST_FILE := \
    $(DEVICE_PATH)/vintf/AHBF@2.1-service.xml \
    $(DEVICE_PATH)/vintf/android.hardware.atrace@1.0-service.xml \
    $(DEVICE_PATH)/vintf/android.hardware.dumpstate@1.1-service.xiaomi.xml \
    $(DEVICE_PATH)/vintf/android.hardware.gnss@2.1-service-qti.xml \
    $(DEVICE_PATH)/vintf/android.hardware.graphics.mapper-impl-qti-display.xml \
    $(DEVICE_PATH)/vintf/android.hardware.ir@1.0-service.xml \
    $(DEVICE_PATH)/vintf/android.hardware.lights-qti.xml \
    $(DEVICE_PATH)/vintf/android.hardware.neuralnetworks@1.3-service-qti.xml \
    $(DEVICE_PATH)/vintf/android.hardware.sensors@2.0-multihal.xml \
    $(DEVICE_PATH)/vintf/android.hardware.thermal@2.0-service.qti.xml \
    $(DEVICE_PATH)/vintf/android.hardware.usb@1.2-service.xml \
    $(DEVICE_PATH)/vintf/android.hardware.wifi.hostapd.xml \
    $(DEVICE_PATH)/vintf/android.hardware.wifi@1.0-service.xml \
    $(DEVICE_PATH)/vintf/c2_manifest_vendor.xml \
    $(DEVICE_PATH)/vintf/fod.xml \
    $(DEVICE_PATH)/vintf/manifest.xml \
    $(DEVICE_PATH)/vintf/manifest_android.hardware.drm@1.3-service.clearkey.xml \
    $(DEVICE_PATH)/vintf/manifest_android.hardware.drm@1.3-service.widevine.xml \
    $(DEVICE_PATH)/vintf/manifest_vendor.dolby.hardware.dms.xml \
    $(DEVICE_PATH)/vintf/manifest_vendor.xiaomi.hardware.cld.xml \
    $(DEVICE_PATH)/vintf/manifest_vendor.xiaomi.hardware.mfidoca.xml \
    $(DEVICE_PATH)/vintf/manifest_vendor.xiaomi.hardware.misecurity.xml \
    $(DEVICE_PATH)/vintf/manifest_vendor.xiaomi.hardware.mlipay.xml \
    $(DEVICE_PATH)/vintf/manifest_vendor.xiaomi.hardware.mtdservice.xml \
    $(DEVICE_PATH)/vintf/manifest_vendor.xiaomi.hardware.tidaservice.xml \
    $(DEVICE_PATH)/vintf/manifest_vendor.xiaomi.hardware.vsimapp.xml \
    $(DEVICE_PATH)/vintf/manifest_yupik.xml \
    $(DEVICE_PATH)/vintf/mi-misight.xml \
    $(DEVICE_PATH)/vintf/mrm.xml \
    $(DEVICE_PATH)/vintf/power.xml \
    $(DEVICE_PATH)/vintf/vendor.dolby.media.c2@1.0-service.xml \
    $(DEVICE_PATH)/vintf/vendor.qti.diag.hal.service.xml \
    $(DEVICE_PATH)/vintf/vendor.qti.gnss@4.0-service.xml \
    $(DEVICE_PATH)/vintf/vendor.qti.hardware.display.allocator-service.xml \
    $(DEVICE_PATH)/vintf/vendor.qti.hardware.display.composer-service.xml \
    $(DEVICE_PATH)/vintf/vendor.qti.hardware.servicetracker@1.2-service.xml \
    $(DEVICE_PATH)/vintf/vendor.qti.hardware.wifi.wificfr@1.0-service.xml \
    $(DEVICE_PATH)/vintf/vendor.xiaomi.cit.bluetooth@1.0_manifest.xml \
    $(DEVICE_PATH)/vintf/vendor.xiaomi.cit.wifi@1.0_manifest.xml \
    $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.citsensorservice@1.1-service.xml \
    $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.micharge@1.0.xml \
    $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.mimd@1.0-service.xml \
    $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.misys@1.0.xml \
    $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.misys@2.0.xml \
    $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.misys@3.0.xml \
    $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.misys@4.0.xml \
    $(DEVICE_PATH)/vintf/vendor.xiaomi.hardware.vibratorfeature.service.xml \
    $(DEVICE_PATH)/vintf/vendor.xiaomi.hw.touchfeature@1.0-service.xml \
    $(DEVICE_PATH)/vintf/vendor.xiaomi.sensor.communicate@1.0_manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/vintf/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/vintf/framework_compatibility_matrix.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/vintf/product_compatibility_matrix.xml
ODM_MANIFEST_FILES := $(DEVICE_PATH)/vintf/manifest_taoyao.xml

# Inherit the proprietary files
include vendor/xiaomi/taoyao/BoardConfigVendor.mk
