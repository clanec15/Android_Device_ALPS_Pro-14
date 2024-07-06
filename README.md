# Unofficial Android device tree for ALPS Pro 14 (K1006R9)

```
#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
```

| Component    | Real Specs |
| -------- | ------- |
| CPU  | MTK6735 (ARM-A53, 1.3GHz clock, 4 cores)[^1]     |
| GPU |  Mali-T720[^2] |
| eMMC | Samsung Q316BB, 14.68GB Usable (15.02GB Real) [^3]  |
| RAM    | 2GB (1.3GB Usable)    |
| Camera | 2, Front and Back facing, (Specs unknown) |
| Android Version | Android 7[^4] |





Compiled using TWRP Minimal branch ```twrp-7.1```\
built using WSL2 (Ubuntu), used 10GB of space \
installed with Arch Linux VM, used ```mtkclient 1.63-2``` \
"original" ```recovery.img``` and ```boot.img``` sourced with:
```sudo mtk r recovery,boot recovery.img,boot.img```

# ***This TWRP device tree might be incomplete and has not been fully tested, use at your own risk***

# Compile instructions (Linux)
0. Create python2 env (for lunch compatibility) and install dependencies
```
$ mkdir ~/bin
$ PATH=~/bin:$PATH
$ ln -s /usr/bin/python2 ~/bin/python
```

```

sudo apt update && sudo apt full-upgrade

sudo apt install git ccache automake lzop bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 g++-multilib python-networkx libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng openjdk-8-jdk repo

```


1. Init the ```twrp-7.1``` branch
```
$ mkdir twrp
$ cd twrp
$ repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-7.1
$ repo sync
```

2. Clone the device tree
```
$ mkdir device && mkdir device/alps && mkdir device/alps/K1006R9
$ cd device/alps/K1006R9
$ git clone https://github.com/clanec15/Android_Device_ALPS_Pro-14.git
$ cd .. && cd .. && cd ..
```

3. Compile
```
$ . build/envsetup.sh
$ lunch omni_K1006R9-eng
$ mka recoveryimage
```
(Output image will be on ```twrp/out/target/product/K1006R9```)

4.- Flash (Using mtkclient on Linux)

```
sudo mtk w recovery ~/location/of/recovery.img
```

# Device tree generated with [twrpdtgen](https://github.com/twrpdtgen/twrpdtgen)

[^1]: Sourced via ```cat /proc/cpuinfo```
[^2]: Sourced with official Mediatek [datasheet](https://www.mediatek.com/products/smartphones-2/mt6735)
[^3]: Sourced via ```cat /sys/class/block/mmcblk0/device/name``` and [link](https://forum.gsmhosting.com/vbb/f664/g532m-boot-repair-done-again-thanks-medusa-team-2565794/)
[^4]: Sourced via ```getprop ro.build.version.release``` and confirmed with SDK Version (24) ```getprop ro.build.version.sdk```

