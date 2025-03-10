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
    libdisplayconfig.qti \
    libdisplayconfig.system.qti \
    libqdMetaData \
    vendor.display.config@1.0.vendor \
    vendor.display.config@1.1.vendor \
    vendor.display.config@1.2.vendor \
    vendor.display.config@1.3.vendor \
    vendor.display.config@1.4.vendor \
    vendor.display.config@1.5.vendor \
    vendor.display.config@1.6.vendor \
    vendor.display.config@1.7.vendor \
    vendor.display.config@1.8.vendor \
    vendor.display.config@1.9.vendor \
    vendor.display.config@1.10.vendor \
    vendor.display.config@1.11.vendor \
    vendor.display.config@1.12.vendor \
    vendor.display.config@1.13.vendor \
    vendor.display.config@1.14.vendor \
    vendor.display.config@1.15.vendor \
    vendor.display.config@2.0.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \
    init.qti.display_boot.sh \
    init.qti.display_boot.rc \
    modetest \
    libmemutils \
    libgpu_tonemapper

PRODUCT_COPY_FILES += \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt35597_video_mode_dsi_truly_panel_with_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_Sharp_4k_cmd_mode_dsc_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_4k_cmd_mode_dsc_dsi_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_Sharp_4k_cmd_mode_dsc_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_4k_video_mode_dsc_dsi_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_sw43404_amoled_cmd_mode_dsi_boe_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_sw43404_amoled_cmd_mode_dsi_boe_panel_with_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_sw43404_amoled_cmd_mode_dsi_boe_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_sw43404_amoled_video_mode_dsi_boe_panel_with_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_sw43404_amoled_cmd_mode_dsi_boe_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_sw43404_amoled_boe_fhd+_panel_with_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_sharp_1080p_cmd_mode_dsi_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt35695b_truly_fhd_command_mode_dsi_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_fhd_cmd_mode_qsync_dsi_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_fhd_video_mode_qsync_dsi_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_2k_cmd_mode_qsync_dsi_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_2k_video_mode_qsync_dsi_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Dual_nt35597_cmd_mode_dsi_truly_panel_without_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Dual_nt35597_video_mode_dsi_truly_panel_without_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_qhd_cmd_mode_dsi_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_bengal_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_td4330_v2_cmd_mode_dsi_truly_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_bengal_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_td4330_v2_video_mode_dsi_truly_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_bengal_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_r66451_amoled_cmd_mode_dsi_visionox_panel_with_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_bengal_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_r66451_amoled_video_mode_dsi_visionox_panel_with_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_bengal_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt36672e_fhd_plus_120Hz_Video_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_bengal_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt36672e_fhd_plus_144Hz_video_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_bengal_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt36672e_60_Hz_fhd_plus_video_mode_panel_without_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_r66451_amoled_cmd_mode_dsi_visionox_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_r66451_amoled_cmd_mode_dsi_visionox_panel_with_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_r66451_amoled_cmd_mode_dsi_visionox_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_r66451_amoled_video_mode_dsi_visionox_panel_with_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_nt36672e_lcd_video_mode_dsi_novatek_fhd_plus_144Hz_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt36672e_fhd_plus_120Hz_Video_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_nt36672e_lcd_video_mode_dsi_novatek_fhd_plus_144Hz_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt36672e_fhd_plus_144Hz_video_panel.xml \
    $(DISPLAY_HAL_DIR)/config/qdcm_calib_data_nt36672e_lcd_video_mode_dsi_novatek_fhd_plus_144Hz_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt36672e_60_Hz_fhd_plus_video_mode_panel_without_DSC.xml \
    $(DISPLAY_HAL_DIR)/config/smomo_setting.xml:$(TARGET_COPY_OUT_VENDOR)/etc/smomo_setting.xml

PRODUCT_VENDOR_PROPERTIES += \
    persist.demo.hdmirotationlock=false \
    vendor.display.disable_rotator_ubwc=1 \
    vendor.display.disable_layer_stitch=0 \
    vendor.display.hw_recovery_threshold=5

# Fingerprint
TARGET_HAS_UDFPS := true

PRODUCT_PACKAGES += \
    libudfpshandler

# OMX
PRODUCT_PACKAGES += \
    libstagefright_softomx.vendor \
    libstagefright_softomx_plugin.vendor \
    libstagefright_foundation

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
    $(DISPLAY_HAL_DIR) \
    $(DISPLAY_HAL_DIR)/gralloc \
    $(DISPLAY_HAL_DIR)/init \
    $(DISPLAY_HAL_DIR)/libdebug

# Sku properties
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/sku/,$(TARGET_COPY_OUT_ODM)/etc)

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/taoyao/taoyao-vendor.mk)
