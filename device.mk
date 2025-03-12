#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Display
DISPLAY_HAL_DIR := hardware/qcom-caf/sm8350/display

PRODUCT_PACKAGES += \
    init.qti.display_boot.rc \
    init.qti.display_boot.sh \
    libdisplayconfig.qti \
    libdisplayconfig.system.qti \
    libgpu_tonemapper \
    libmemutils \
    libqdMetaData \
    modetest \
    vendor.display.config@1.0.vendor \
    vendor.display.config@1.1.vendor \
    vendor.display.config@1.10.vendor \
    vendor.display.config@1.11.vendor \
    vendor.display.config@1.12.vendor \
    vendor.display.config@1.13.vendor \
    vendor.display.config@1.14.vendor \
    vendor.display.config@1.15.vendor \
    vendor.display.config@1.2.vendor \
    vendor.display.config@1.3.vendor \
    vendor.display.config@1.4.vendor \
    vendor.display.config@1.5.vendor \
    vendor.display.config@1.6.vendor \
    vendor.display.config@1.7.vendor \
    vendor.display.config@1.8.vendor \
    vendor.display.config@1.9.vendor \
    vendor.display.config@2.0.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor

PRODUCT_COPY_FILES += \
    $(DISPLAY_HAL_DIR)/config/smomo_setting.xml:$(TARGET_COPY_OUT_VENDOR)/etc/smomo_setting.xml

# Fingerprint
TARGET_HAS_UDFPS := true

PRODUCT_PACKAGES += \
    libudfpshandlerfactory

# OMX
PRODUCT_PACKAGES += \
    libstagefright_foundation \
    libstagefright_softomx_plugin.vendor \
    libstagefright_softomx.vendor

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
    $(DISPLAY_HAL_DIR) \
    $(DISPLAY_HAL_DIR)/gralloc \
    $(DISPLAY_HAL_DIR)/init \
    $(DISPLAY_HAL_DIR)/libdebug \
    $(LOCAL_PATH)

# Sku properties
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/sku/,$(TARGET_COPY_OUT_ODM)/etc)

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/qca6750/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/qca6750/WCNSS_qcom_cfg.ini

PRODUCT_PACKAGES += \
    firmware_qca6750_WCNSS_qcom_cfg.ini_symlink

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/taoyao/taoyao-vendor.mk)
