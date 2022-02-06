# android_device_xiaomi_alioth-SHRP
For building SHRP for Xiaomi Mi 11X / Redmi K40 / POCO F3

SHRP device tree for Xiaomi Mi 11X / Redmi K40 / POCO F3

The Xiaomi Mi 11X (codenamed _"aliothin"_) and Redmi K40 / POCO F3 (codenamed _"alioth"_) are mid range smartphones from Xiaomi.

## Device specifications

| Device       | Xiaomi Mi 11X / Redmi K40 / POCO F3         |
| -----------: | :------------------------------------------ |
| SoC          | Qualcomm SM8250 Snapdragon 870 5G           |
| CPU          | 8x Qualcomm® Kryo™ 585 up to 2.84GHz        |
| GPU          | Adreno 650                                  |
| Memory       | 8GB / 6GB  (LPDDR 5)                        |
| Shipped Android version | 11                               |
| Storage      | 128GB  (UFS 3.1)                            |
| Battery      | Li-Po 4520 mAh, non-removable               |
| Dimensions   | 163.7 x 76.4 x 7.8 mm                       |
| Display      | 1080 x 2400 (20:9), 6.67 inches             |

## Device picture

![Xiaomi Mi 11X](https://i01.appmifile.com/webfile/globalimg/7/7BFCB70B-C506-E089-8591-9F2A15CA61FE.png)

## Features

**Works**

- Booting.
- **Decryption** (Android 11)
- ADB
- MTP
- OTG
- vA/B partition functions
- Vibration

Mi 11X / Redmi K40 / POCO F3 is using Virtual A/B Partition Scheme!

## Compile

First checkout SHRP with aosp tree:

```
repo init -u git://github.com/SHRP/manifest.git -b v3_10.0
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

Use ccache
```
#Enable ccache
export USE_CCACHE=1
export CCACHE_EXEC=$(which ccache)
```

Finally execute these:

```
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch twrp_alioth-eng
mka adbd bootimage
```

To test it:

```
fastboot boot out/target/product/alioth/boot.img
```

## Thanks
- [Original Tree By Nebrassy](https://github.com/TeamWin/android_device_xiaomi_alioth)
