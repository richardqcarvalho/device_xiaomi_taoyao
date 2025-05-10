#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from taoyao device
$(call inherit-product, device/xiaomi/taoyao/device.mk)

# Inherit from common PixelOS configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

TARGET_BOOT_ANIMATION_RES := 1080
TARGET_HAS_UDFPS := true
TARGET_INCLUDE_ACCORD := false
TARGET_ENABLE_BLUR := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_taoyao
PRODUCT_DEVICE := taoyao
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := 2203129G

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="taoyao_global-user 14 UKQ1.231003.002 V816.0.17.0.ULIMIXM release-keys" \
    BuildFingerprint=Xiaomi/taoyao_global/taoyao:14/UKQ1.231003.002/V816.0.17.0.ULIMIXM:user/release-keys \
    DeviceProduct=taoyao \
    SystemName=taoyao_global

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
