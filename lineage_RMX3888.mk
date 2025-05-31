#
# Copyright (C) 2021-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from RMX3888 device
$(call inherit-product, device/realme/RMX3888/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_RMX3888
PRODUCT_DEVICE := RMX3888
PRODUCT_MANUFACTURER := realme
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX3888

PRODUCT_GMS_CLIENTID_BASE := android-realme

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="RMX3888-user 15 UKQ1.231108.008 U.202502152149 release-keys" \
    BuildFingerprint=realme/RMX3888/RE5C37:15/UKQ1.231108.008/U.202502152149:user/release-keys \
    DeviceName=RMX3888 \
    DeviceProduct=RMX3888 \
    SystemDevice=RMX3888 \
    SystemName=RMX3888
