#!/bin/bash
#
# 使用方法: ./copy.sh [xCode路径]
# 注意: 使用完成后, xCode 项目需要额外设置, File->Workspace Setting...->Build System 选择 Legacy Build System
#
cp ./device/libstdc++.* $1/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/
cp ./simulators/libstdc++.* $1/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/
cp ./runtime/libstdc++.* $1/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/