#!/bin/bash
#
# 使用方法: ./copy.sh [Xcode路径]
# 注意: 使用完成后, Xcode 项目需要额外设置, File->Workspace Setting...->Build System 选择 Legacy Build System
#

if [ -n "$1" ]; then
    cp ./device/libstdc++.* $1/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/
    cp ./simulators/libstdc++.* $1/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/
    cp ./runtime/libstdc++.* $1/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/
else
    echo "使用方法: ./copy.sh [Xcode路径]"
    echo "请添加 Xcode路径"
fi