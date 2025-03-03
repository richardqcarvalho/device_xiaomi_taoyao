#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

KERNEL_LLVM_SUPPORT := true
KERNEL_SD_LLVM_SUPPORT := false
KERNEL_MODULES_INSTALL := dlkm
KERNEL_MODULES_OUT := out/target/product/taoyao/$(KERNEL_MODULES_INSTALL)/lib/modules

TARGET_HAS_UDFPS := true

PRODUCT_PACKAGES += \
     libudfpshandler

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/display_id_4630946545580055170.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946545580055170.xml \
    $(LOCAL_PATH)/configs/display/display_id_4630946480857061762.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946480857061762.xml

PRODUCT_SYSTEM_PROPERTIES += \
    ro.product.mod_device=taoyao_global

PRODUCT_PACKAGES += \
    TaoyaoCarrierConfigOverlay \
    TaoyaoFrameworksOverlay \
    TaoyaoSettingsOverlay \
    TaoyaoSystemUIOverlay \
    TaoyaoTelephonyOverlay

PRODUCT_PACKAGES += \
    taoyaoCNSettingsProviderOverlay \
    taoyaoCNWifiOverlay \
    taoyaoGLSettingsProviderOverlay \
    taoyaoGLWifiOverlay \
    TaoyaoNfcOverlay

# Sensors
PRODUCT_PACKAGES += \
    sensors.xiaomi.v2

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    device/xiaomi/taoyao-kernel

# Sku properties
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/sku/,$(TARGET_COPY_OUT_ODM)/etc)

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/taoyao/taoyao-vendor.mk)
