#
# Copyright (C) 2021-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/RMX3888

# Assert
TARGET_OTA_ASSERT_DEVICE := RMX3888
BUILD_BROKEN_DUP_RULES := true

# Display
TARGET_SCREEN_DENSITY := 640

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 103

# Include the proprietary files BoardConfig.
include vendor/realme/RMX3888/BoardConfigVendor.mk

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    odm \
    product \
    recovery \
    system \
    system_dlkm \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor \
    vendor_boot \
    vendor_dlkm

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv9-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

# Audio
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_GKI := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_AGM_HIDL := true
AUDIO_FEATURE_ENABLED_LSM_HIDL := true
AUDIO_FEATURE_ENABLED_PAL_HIDL := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SSR := true
AUDIO_FEATURE_ENABLED_SVA_MULTI_STAGE := true
BOARD_SUPPORTS_OPENSOURCE_STHAL := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
TARGET_PROVIDES_AUDIO_HAL := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := pineapple

# Boot
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_RAMDISK_USE_LZ4 := true

# Camera
TARGET_CAMERA_PACKAGE_NAME := com.oplus.camera

# DTB / DTBO
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_USES_QCOM_MERGE_DTBS_SCRIPT := true
TARGET_NEEDS_DTBOIMAGE := true

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/configs/props/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/props/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/configs/props/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/props/config.fs

# Fingerprint
TARGET_SURFACEFLINGER_UDFPS_LIB := //device/realme/RMX3888:libudfps_extension.RMX3888

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    hardware/oplus/vintf/device_framework_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest/framework_manifest.xml
DEVICE_MATRIX_FILE := \
    hardware/qcom-caf/common/compatibility_matrix.xml \
    hardware/qcom-caf/sm8650/audio/primary-hal/configs/common/manifest_non_qmaa.xml \
    hardware/qcom-caf/sm8650/audio/primary-hal/configs/common/manifest_non_qmaa_extn.xml
DEVICE_MANIFEST_FILE := \
    $(DEVICE_PATH)/configs/manifest/manifest.xml \
    $(DEVICE_PATH)/configs/manifest/network_manifest.xml \
    hardware/qcom-caf/sm8650/audio/primary-hal/configs/common/manifest_non_qmaa.xml \
    hardware/qcom-caf/sm8650/audio/primary-hal/configs/common/manifest_non_qmaa_extn.xml

ODM_MANIFEST_FILES := \
    $(DEVICE_PATH)/configs/manifest/network_manifest_odm.xml \
    $(DEVICE_PATH)/configs/manifest/nfc_manifest_odm.xml

# Init Boot
BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_INIT_ARGS += --header_version $(BOARD_INIT_BOOT_HEADER_VERSION)

# Kernel
BOARD_BOOTCONFIG := \
    androidboot.console=null \
    androidboot.hardware=qcom \
    androidboot.hypervisor.protected_vm.supported=true \
    androidboot.load_modules_parallel=true \
    androidboot.memcg=1 \
    androidboot.vendor.qspa=true \
    androidboot.usbcontroller=a600000.dwc3

BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image

TARGET_KERNEL_SOURCE := kernel/realme/sm8650
TARGET_KERNEL_CONFIG := \
    gki_defconfig \
    vendor/pineapple_GKI.config \
    vendor/oplus/pineapple_GKI.config

# Kernel modules
BOARD_SYSTEM_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.system_dlkm))
SYSTEM_KERNEL_MODULES := $(BOARD_SYSTEM_KERNEL_MODULES_LOAD)
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules.blocklist
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.pineapple $(DEVICE_PATH)/modules.load.oplus))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.vendor_boot.pineapple $(DEVICE_PATH)/modules.load.vendor_boot.oplus))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery.pineapple $(DEVICE_PATH)/modules.load.recovery.oplus))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)

TARGET_KERNEL_EXT_MODULE_ROOT := kernel/realme/sm8650-modules
TARGET_KERNEL_EXT_MODULES := \
 	qcom/opensource/mmrm-driver \
 	qcom/opensource/mm-drivers/hw_fence \
 	qcom/opensource/mm-drivers/msm_ext_display \
 	qcom/opensource/mm-drivers/sync_fence \
 	qcom/opensource/securemsm-kernel \
 	qcom/opensource/audio-kernel \
 	qcom/opensource/synx-kernel \
 	qcom/opensource/camera-kernel \
 	qcom/opensource/datarmnet-ext/mem \
 	qcom/opensource/dataipa/drivers/platform/msm \
 	qcom/opensource/datarmnet/core \
 	qcom/opensource/datarmnet-ext/aps \
 	qcom/opensource/datarmnet-ext/offload \
 	qcom/opensource/datarmnet-ext/shs \
 	qcom/opensource/datarmnet-ext/perf \
 	qcom/opensource/datarmnet-ext/perf_tether \
 	qcom/opensource/datarmnet-ext/sch \
 	qcom/opensource/datarmnet-ext/wlan \
 	qcom/opensource/display-drivers/msm \
 	qcom/opensource/dsp-kernel \
 	qcom/opensource/eva-kernel \
 	qcom/opensource/video-driver \
 	qcom/opensource/graphics-kernel \
 	qcom/opensource/wlan/platform \
 	qcom/opensource/wlan/qcacld-3.0 \
 	qcom/opensource/bt-kernel \
 	qcom/opensource/spu-kernel \
 	qcom/opensource/mm-sys-kernel/ubwcp \
 	nxp/opensource/driver

# Lineage Health
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_PATH := /sys/class/oplus_chg/battery/mmi_charging_enable

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := pineapple
TARGET_KERNEL_ADDITIONAL_FLAGS += TARGET_BOARD_PLATFORM=$(TARGET_BOARD_PLATFORM)

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_PRODUCTIMAGE_MINIMAL_PARTITION_RESERVED_SIZE := false
-include vendor/lineage/config/BoardConfigReservedSize.mk
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 233523179520
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_dlkm system_ext vendor vendor_dlkm
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE ?= 17175674800
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE ?= 17175674800
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Power
TARGET_POWERHAL_MODE_EXT := $(DEVICE_PATH)/power/power-mode.cpp
BOARD_POWER_CUSTOM_BOARD_LIB += \
    vendor.oplus.hardware.touch-V1-ndk

# Recovery
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security
BOOT_SECURITY_PATCH := 2024-12-05
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# SEPolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk
include device/lineage/sepolicy/libperfmgr/sepolicy.mk
include hardware/oplus/sepolicy/qti/SEPolicy.mk

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 4

BOARD_AVB_DTBO_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_DTBO_ALGORITHM := SHA256_RSA4096
BOARD_AVB_DTBO_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_DTBO_ROLLBACK_INDEX_LOCATION := 3

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := system system_dlkm system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_VBMETA_VENDOR := odm vendor vendor_dlkm
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 5

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := $(BOARD_HOSTAPD_DRIVER)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := $(BOARD_HOSTAPD_PRIVATE_LIB)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB_EVENT := "ON"
CONFIG_IEEE80211AX := true
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

