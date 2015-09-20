USE_CAMERA_STUB := true

# Define Headers
TARGET_SPECIFIC_HEADER_PATH := device/nokia/normandy/include

# Calling Vendor Extra
INSTALL_OLD_SENSORS := true
INSTALL_NOKIAX_MODULES := true
INSTALL_ADDITIONAL_ETC := true
INSTALL_ADDITIONAL_SCRIPTS := true

# inherit from the proprietary version
-include vendor/nokia/normandy/BoardConfigVendor.mk

# Target Specifications
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a5
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOOTLOADER_BOARD_NAME := normandy

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

TARGET_USES_ION := true

TARGET_BOARD_PLATFORM_GPU := qcom-adreno203
BOARD_USES_ADRENO_200 := true

# Kernel
BOARD_KERNEL_BASE    := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SPARESIZE := 128
BOARD_KERNEL_BCHECC_SPARESIZE := 160
TARGET_USES_UNCOMPRESSED_KERNEL := false
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom loglevel=1 vmalloc=200M androidboot.selinux=permissive
ARCH_ARM_HAVE_TLS_REGISTER := true

#TARGET_PREBUILT_KERNEL := device/nokia/normandy/kernel
TARGET_KERNEL_SOURCE := kernel/nokia/normandy
TARGET_KERNEL_CONFIG := normandy_selinux_defconfig
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

BOARD_HAS_NO_SELECT_BUTTON := true

# Support to build images for 2K NAND page
BOARD_KERNEL_2KSPARESIZE := 64

# Partitions format
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p19
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p18
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_DATA_DEVICE := /dev/block/mmcblk0p22
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw


# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 465567744
BOARD_USERDATAIMAGE_PARTITION_SIZE := 314556416
BOARD_PERSISTIMAGE_PARTITION_SIZE := 10485760
BOARD_CACHEIMAGE_PARTITION_SIZE := 41943040
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Qcom HW
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED
COMMON_GLOBAL_CFLAGS += -DUSE_MDP3
COMMON_GLOBAL_CFLAGS += -DLPA_DEFAULT_BUFFER_SIZE=480

#Options
BOARD_USES_GENERIC_AUDIO := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp -mtune=cortex-a5
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp -mtune=cortex-a5
COMMON_GLOBAL_CFLAGS += -DQCOM_DIRECTTRACK
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP_LEGACY

# Optimizations
TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
TARGET_GRALLOC_USES_ASHMEM := true

BOARD_WANTS_EMMC_BOOT := true

WITH_ART_SMALL_MODE := true

# Media
TARGET_QCOM_MEDIA_VARIANT := caf
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/nokia/normandy/bluetooth

# Camera
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB -DNEEDS_VECTORIMPL_SYMBOLS

# audio 
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_HAS_QACT := true

# FM
AUDIO_FEATURE_ENABLED_FM := true

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_AMSS_VERSION := 6225
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Dalvik
TARGET_ARCH_LOWMEM := true

# Display
BOARD_EGL_CFG := device/nokia/normandy/config/egl.cfg
USE_OPENGL_RENDERER := true
#TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true                                           
BOARD_EGL_WORKAROUND_BUG_10194508 := true                                   
BOARD_USE_MHEAP_SCREENSHOT := true
TARGET_DOESNT_USE_FENCE_SYNC := true

# CM Hardware
BOARD_HARDWARE_CLASS := device/nokia/normandy/cmhw

# Lights
#TARGET_PROVIDES_LIBLIGHT := true

# ril
BOARD_RIL_CLASS := ../../../device/nokia/normandy/ril

# SELinux
include device/qcom/sepolicy/sepolicy.mk

# Webkit
ENABLE_WEBGL := true
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
TARGET_FORCE_CPU_UPLOAD := true

# Assert
TARGET_OTA_ASSERT_DEVICE := normandy,msm8625

# Don't generate block mode update zips
#BLOCK_BASED_OTA := false

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),userdebug)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
DONT_DEXPREOPT_PREBUILTS := true

#low-ram
MALLOC_IMPL := dlmalloc
TARGET_BOOTANIMATION_TEXTURE_CACHE := false

# Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HAS_ATH_WLAN := true
BOARD_WLAN_DEVICE := ath6kl
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/ath6kl/ath6kl_sdio.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_EXT_MODULE_PATH := "/system/lib/modules/ath6kl/cfg80211.ko"
WIFI_EXT_MODULE_NAME := "cfg80211"
#WIFI_DRIVER_FW_PATH_PARAM := "/data/misc/wifi/fwpath"

TARGET_CUSTOM_WIFI := ../../device/nokia/normandy/libhardware_legacy/wifi/wifi.c


# Storage / Sharing
BOARD_VOLD_MAX_PARTITIONS := 35
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"

# Use file-based OTA zips
BLOCK_BASED_OTA := false

# Recovery
TARGET_RECOVERY_FSTAB := device/nokia/normandy/twrp.fstab
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
DEVICE_RESOLUTION := 480x800
TW_FLASH_FROM_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/sdcard1"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_DEFAULT_EXTERNAL_STORAGE := true

#Additional apps
ADD_SlimFileManager := true
ADD_SETUP_WIZARD := false
ADD_CUSTOM_WEBVIEW := true
BOARD_USES_CYANOGEN_HARDWARE := true
