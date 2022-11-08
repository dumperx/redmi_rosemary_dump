#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    init.insmod.sh \

PRODUCT_PACKAGES += \
    fstab.enableswap \
    factory_init.connectivity.common.rc \
    factory_init.project.rc \
    init.sensor_1_0.rc \
    init.modem.rc \
    meta_init.modem.rc \
    init.ago.rc \
    meta_init.connectivity.common.rc \
    init.connectivity.rc \
    init.mt6785.usb.rc \
    init.cgroup.rc \
    init.stnfc.rc \
    factory_init.rc \
    init.mt6785.rc \
    meta_init.connectivity.rc \
    init.project.rc \
    meta_init.project.rc \
    factory_init.connectivity.rc \
    init.aee.rc \
    init.connectivity.common.rc \
    meta_init.rc \
    multi_init.rc \
    init_connectivity.rc \
    init.recovery.hardware.rc \
    init.recovery.mt6785.rc \
    miui.factoryreset.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.enableswap:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.enableswap

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/rosemary/rosemary-vendor.mk)
