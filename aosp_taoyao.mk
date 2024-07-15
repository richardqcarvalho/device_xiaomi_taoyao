#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from taoyao device
$(call inherit-product, device/xiaomi/taoyao/device.mk)

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := taoyao
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := aosp_taoyao
PRODUCT_MODEL := Xiaomi 12 Lite

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi