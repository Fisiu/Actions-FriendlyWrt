#!/bin/bash

sed -i -e '/CONFIG_MAKE_TOOLCHAIN=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_IB=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_SDK=y/d' configs/rockchip/01-nanopi
