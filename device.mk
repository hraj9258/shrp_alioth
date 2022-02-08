#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8250-common
$(call inherit-product, device/xiaomi/alioth/kona.mk)
#$(call inherit-product, vendor/xiaomi/alioth/alioth-vendor.mk)

PRODUCT_SHIPPING_API_LEVEL := 30

#Audio
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/xiaomi/alioth/audio,$(TARGET_COPY_OUT_VENDOR)/etc)
 
#Init Recovery
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/recovery/root/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc    
     
# Keylayout
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
     $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/idc/uinput-fpc.kl \
     $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl
     
# Virtual A/B OTA
$(call inherit-product, \
    $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
    
# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
	android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd    

# A/B
ENABLE_VIRTUAL_AB := true
     
# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay 
    
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display

ALLOW_MISSING_DEPENDENCIES := true

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
BOARD_USES_QCOM_FBE_DECRYPTION := true

TARGET_RECOVERY_DEVICE_MODULES += libion libandroidicu vendor.display.config@1.0 vendor.display.config@2.0 libdisplayconfig.qti

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 1200
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_NO_SCREEN_BLANK := true
TW_EXCLUDE_APEX := true

# Vibrator
TW_SUPPORT_INPUT_AIDL_HAPTICS := true

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/alioth/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so
    
# OEM otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
   $(LOCAL_PATH)/security/miui   

# # SHRP specific device flags
# SHRP_DEVICE_CODE := alioth
# SHRP_PATH := device/xiaomi/alioth
# SHRP_MAINTAINER := Pranav_Talmale
# SHRP_REC_TYPE := SAR
# SHRP_DEVICE_TYPE := A/B
# SHRP_REC := /dev/block/bootdevice/by-name/boot
# SHRP_EDL_MODE := 1
# SHRP_INTERNAL := /sdcard
# SHRP_EXTERNAL := /external_sd
# SHRP_OTG := /usb_otg
# SHRP_FLASH := 1
# SHRP_AB := true
# SHRP_STATUSBAR_RIGHT_PADDING := 48
# SHRP_STATUSBAR_LEFT_PADDING := 48
# SHRP_NOTCH := true
# SHRP_EXPRESS := true
# SHRP_EXPRESS_USE_DATA := true
# SHRP_DARK := true
# SHRP_CUSTOM_FLASHLIGHT := false
# SHRP_FLASH_MAX_BRIGHTNESS := 300
# SHRP_NO_SAR_AUTOMOUNT := true
# SHRP_LITE := false
# SHRP_OFFICIAL := true
