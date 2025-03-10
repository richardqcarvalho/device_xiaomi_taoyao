#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/taoyao

TARGET_BOOTLOADER_BOARD_NAME := taoyao

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Display
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_HWC2 := true
TARGET_USES_QCOM_DISPLAY_BSP := true
TARGET_HAS_WIDE_COLOR_DISPLAY := true
TARGET_HAS_HDR_DISPLAY := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USE_COLOR_MANAGEMENT := true
SF_WCG_COMPOSITION_DATA_SPACE := 143261696
TARGET_USES_QTI_MAPPER_2_0 := true
TARGET_USES_QTI_MAPPER_EXTENSIONS_1_1 := true
TARGET_USES_GRALLOC4 := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/hidl/vendor_framework_compatibility_matrix.xml \
    $(DEVICE_PATH)/hidl/xiaomi_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/hidl/manifest_lahaina.xml \
    $(DEVICE_PATH)/hidl/manifest_xiaomi.xml \
    $(DEVICE_PATH)/hidl/manifest_taoyao.xml

# Kernel
TARGET_KERNEL_CONFIG += vendor/taoyao_QGKI.config
TARGET_NO_KERNEL_OVERRIDE := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilts/dtb.img:$(TARGET_COPY_OUT)/dtb.img \
    $(DEVICE_PATH)/prebuilts/kernel:kernel

BOARD_KERNEL_MODULE_DIRS := 5.4-gki
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := \
    $(DEVICE_PATH)/prebuilts/modules/msm_drm.ko \
    $(DEVICE_PATH)/prebuilts/modules/focaltech_touch.ko \
    $(DEVICE_PATH)/prebuilts/modules/goodix_core.ko \
    $(DEVICE_PATH)/prebuilts/modules/hwid.ko \
    $(DEVICE_PATH)/prebuilts/modules/xiaomi_touch.ko
BOARD_VENDOR_KERNEL_MODULES := $(strip $(shell find $(DEVICE_PATH)/prebuilts/modules -maxdepth 1 -name "*.ko"))
BOARD_VENDOR_KERNEL_MODULES_5.4-gki := $(strip $(shell find $(DEVICE_PATH)/prebuilts/modules/5.4-gki -maxdepth 1 -name "*.ko"))

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
include hardware/qcom-caf/common/BoardConfigQcom.mk
