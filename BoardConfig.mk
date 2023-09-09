#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/apollon

# Inherit from sm8250-common
include device/xiaomi/sm8250-common/BoardConfigCommon.mk

BUILD_BROKEN_DUP_RULES := true

# Display
TARGET_SCREEN_DENSITY := 440

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):init_xiaomi_apollon
TARGET_RECOVERY_DEVICE_MODULES := init_xiaomi_apollon

# Kernel
TARGET_KERNEL_CONFIG += vendor/xiaomi/apollo.config

TARGET_KERNEL_CLANG_VERSION := neutron
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_ADDITIONAL_FLAGS := LLVM=1 LLVM_IAS=1
TARGET_KERNEL_ADDITIONAL_FLAGS += LD=ld.lld AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip
TARGET_KERNEL_ADDITIONAL_FLAGS += HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# OTA assert
TARGET_OTA_ASSERT_DEVICE := apollon,apollo,apollopro

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Inherit from the proprietary version
include vendor/xiaomi/apollon/BoardConfigVendor.mk

# Inherit from Xiaomi-Firmware
include vendor/xiaomi-firmware/apollo/firmware.mk
