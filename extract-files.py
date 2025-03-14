#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'vendor/xiaomi/sm8350-common',
    'device/xiaomi/sm8350-common',
    'hardware/qcom-caf/sm8350',
    'hardware/qcom-caf/wlan',
    'hardware/xiaomi',
    'vendor/qcom/opensource/commonsys/display',
    'vendor/qcom/opensource/commonsys-intf/display',
    'vendor/qcom/opensource/dataservices',
    'vendor/qcom/opensource/display',
]

# Define lib fixups
def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'vendor.xiaomi.hardware.campostproc@1.0',
    ): lib_fixup_vendor_suffix,
}

blob_fixups: blob_fixups_user_type = {
    # PureShot/PureView XML fixes
    ('vendor/etc/camera/pureShot_parameter.xml', 'vendor/etc/camera/pureView_parameter.xml'): blob_fixup()
        .regex_replace(r'=(\d+)>', r'="\1">'),
    
    # Camera library hex replacements
    'vendor/lib64/hw/camera.qcom.so': blob_fixup()
        .binary_regex_replace(
            b'\x73\x74\x5F\x6C\x69\x63\x65\x6E\x73\x65\x2E\x6C\x69\x63',
            b'\x63\x61\x6D\x65\x72\x61\x5F\x63\x6E\x66\x2E\x74\x78\x74'
        )
        .regex_replace('libmegface.so', 'libfacedet.so')
        .regex_replace('libMegviiFacepp-0.5.2.so', 'libFaceDetectpp-0.5.2.so')
        .regex_replace('megviifacepp_0_5_2_model', 'facedetectpp_0_5_2_model'),
    
    # Xiaomi camera HAL patch
    'vendor/lib64/hw/camera.xiaomi.so': blob_fixup()
        .sig_replace('29 07 00 94', '1F 20 03 D5'),
    
    # Motion tuning XML fix
    'vendor/etc/camera/taoyao_motiontuning.xml': blob_fixup()
        .regex_replace('xml=version', 'xml version'),
    
    # DisplayFeature library patches
    'vendor/lib64/hw/displayfeature.default.so': blob_fixup()
        .replace_needed('libstagefright_foundation.so', 'libstagefright_foundation-v33.so'),
    
    # libmi-stc-HW-modulate.so patch
    'proprietary/vendor/lib64/libmi-stc-HW-modulate.so': blob_fixup()
        .replace_needed('libstagefright_foundation.so', 'libstagefright_foundation-v33.so'),
    
    # CHI override library path fix
    'vendor/lib64/hw/com.qti.chi.override.so': blob_fixup()
        .regex_replace('/system/lib64/libion.so', '/vendor/lib64/libion.so'),
    
    # Mialgoengine library path fix
    'vendor/lib64/libmialgoengine.so': blob_fixup()
        .regex_replace(
            '/system/lib64/android.hardware.graphics.allocator@3.0.so',
            '/vendor/lib64/android.hardware.graphics.allocator@3.0.so'
        ),
}  # fmt: skip

module = ExtractUtilsModule(
    'taoyao',
    'xiaomi',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    add_firmware_proprietary_file=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'sm8350-common', module.vendor
    )
    utils.run()
