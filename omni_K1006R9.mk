#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from K1006R9 device
$(call inherit-product, device/alps/K1006R9/device.mk)

PRODUCT_DEVICE := K1006R9
PRODUCT_NAME := omni_K1006R9
PRODUCT_BRAND := X20
PRODUCT_MODEL := X11Pro
PRODUCT_MANUFACTURER := alps

PRODUCT_GMS_CLIENTID_BASE := alps-full_aeon6735_66_d_n-mx

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_aeon6735_66_d_n-user 7.0 NRD90M 1689676719 test-keys"

BUILD_FINGERPRINT := alps/full_aeon6735_66_d_n/aeon6735_66_d_n:7.0/NRD90M/1689676719:user/test-keys
