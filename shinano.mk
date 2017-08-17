# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from msm8974-common
$(call inherit-product, device/sony/msm8974-common/msm8974.mk)

# inherit BCM4339 open-source firmware
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4339/device-bcm.mk)

# Include non-opensource parts
$(call inherit-product, vendor/sony/shinano-common/shinano-common-vendor.mk)

PLATFORM_PATH := device/sony/shinano-common

DEVICE_PACKAGE_OVERLAYS += $(PLATFORM_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Init
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(PLATFORM_PATH)/rootdir/init.qcom.power.rc:root/init.qcom.power.rc \
    $(PLATFORM_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(PLATFORM_PATH)/rootdir/init.shims.rc:root/init.shims.rc \
    $(PLATFORM_PATH)/rootdir/init.sony.rc:root/init.sony.rc \
    $(PLATFORM_PATH)/rootdir/init.sony.usb.rc:root/init.sony.usb.rc \
    $(PLATFORM_PATH)/rootdir/init.sony-msm8974.rc:root/init.sony-msm8974.rc \
    $(PLATFORM_PATH)/rootdir/init.sony-platform.rc:root/init.sony-platform.rc \
    $(PLATFORM_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc

# Recovery Init
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/rootdir/init.qcom.power.rc:root/init.recovery.qcom.rc

# Camera (stock .291 blobs)
PRODUCT_PACKAGES += \
	libshims_signal \
	libshims_idd \
        libsonycamera

# TrimArea daemon
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/rootdir/sbin/tad_static:root/sbin/tad_static \
    $(PLATFORM_PATH)/rootdir/init.credmgr.sh:root/system/bin/init.credmgr.sh

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Audio
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/configs/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(PLATFORM_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_PACKAGES += \
    tfa9890_amp

# Bluetooth & MAC Address
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/configs/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

PRODUCT_PACKAGES += \
    macaddrsetup

# Assertive Display
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/configs/display/ad_calib.cfg:system/etc/ad_calib.cfg

# GPS
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/configs/gps/flp.conf:system/etc/flp.conf \
    $(PLATFORM_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
    $(PLATFORM_PATH)/configs/gps/izat.conf:system/etc/izat.conf \
    $(PLATFORM_PATH)/configs/gps/sap.conf:system/etc/sap.conf

PRODUCT_PACKAGES += \
    gps.msm8974

# Keylayout
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(PLATFORM_PATH)/configs/keylayout/mhl-rcp.kl:system/usr/keylayout/mhl-rcp.kl \
    $(PLATFORM_PATH)/configs/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl:system/usr/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl

# Media profiles
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(PLATFORM_PATH)/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    com.android.nfc_extras \
    nfc_nci.pn54x.default

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# Qualcomm Modem Interface
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/configs/qmi/dsi_config.xml:system/etc/data/dsi_config.xml \
    $(PLATFORM_PATH)/configs/qmi/netmgr_config.xml:system/etc/data/netmgr_config.xml \
    $(PLATFORM_PATH)/configs/qmi/qmi_config.xml:system/etc/data/qmi_config.xml \
    $(PLATFORM_PATH)/configs/qmi/sec_config:system/etc/sec_config

# FM
PRODUCT_PACKAGES += \
   FMRadio \
   brcm-uim-sysfs \
   libfmradio.v4l2-fm

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8974

# Off mode charger
PRODUCT_PACKAGES += \
    charger_res_images
