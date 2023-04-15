# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common PixelExperience stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Inherit from taoyao device
# $(call inherit-product, device/xiaomi/taoyao/device.mk)

TARGET_USES_AOSP_RECOVERY := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_INCLUDE_LIVE_WALLPAPERS := false

PRODUCT_NAME := aosp_taoyao
PRODUCT_DEVICE := taoyao
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi 12 Lite
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="taoyao_global-user 13 TKQ1.220807.001 V14.0.4.0.TLIMIXM release-keys"

BUILD_FINGERPRINT := Xiaomi/taoyao_global/taoyao:13/RKQ1.211001.001/V14.0.4.0.TLIMIXM:user/release-keys