#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from apollon device
$(call inherit-product, device/xiaomi/apollon/device.mk)

# riceDroid flags
RISING_CHIPSET := sm8250
RISING_MAINTAINER := Niemandausduisburg
TARGET_USE_PIXEL_FINGERPRINT := false
TARGET_BUILD_APERTURE_CAMERA := true
ifeq ($(BUILD_GAPPS),false)
RISING_PACKAGE_TYPE := AOSP
endif
TARGET_EXCLUDES_AUDIOFX := false

# MindtheGapps
ifeq ($(BUILD_GAPPS),true)
WITH_GMS := false
TARGET_CORE_GMS := false
RISING_PACKAGE_TYPE := MindtheGapps
$(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
endif

PRODUCT_NAME := lineage_apollon
PRODUCT_DEVICE := apollon
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi Mi 10T

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="apollo_global-user 12 RKQ1.211001.001 V14.0.4.0.SJDMIXM release-keys"

BUILD_FINGERPRINT := Xiaomi/apollo_global/apollo:12/RKQ1.211001.001/V14.0.4.0.SJDMIXM:user/release-keys
