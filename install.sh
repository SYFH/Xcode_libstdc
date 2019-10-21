#!/bin/bash
#
# 使用方法: ./copy.sh
# 注意: 使用完成后, Xcode 项目需要额外设置, File->Workspace Setting...->Build System 选择 Legacy Build System
#

# 获取基本变量
xcode_path=`xcode-select --print-path`
xcode_version=`/usr/bin/xcodebuild -version | sed -En 's/Xcode[[:space:]]+([0-9\.]*)/\1/p'`
xcode_version=`expr $xcode_version`
xcode_change_path_version=`expr '11.0'`
xcode_is_11=`echo "$xcode_version >= $xcode_change_path_version" | bc`

# 根据版本获取目标路径
if [[ $xcode_is_11 == '1' ]]; then
    echo '是 Xcode 11 及以上版本'

    xcode_device_path="$xcode_path/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/"
    xcode_simulators_path="$xcode_path/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/"
    xcode_runtime_path="$xcode_path/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/"
else
    echo '不是 Xcode 11 及以上版本'

    xcode_device_path="$xcode_path/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/"
    xcode_simulators_path="$xcode_path/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/"
    xcode_runtime_path="$xcode_path/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/"
fi

# 检测路径是否存在
if [[ ! -d "$xcode_device_path" || ! -d "$xcode_simulators_path" || ! -d "$xcode_runtime_path" ]]; then
    echo "Xcode 版本: $xcode_version"
    echo "Xcode 内部路径: $xcode_path"
    echo "目标路径不存在"
    exit
fi

# 检测目标路径是否有可写权限
if [[ ! -w "$xcode_device_path" || ! -w "$xcode_device_path" || ! -w "$xcode_device_path" ]]; then
    echo "目标路径没有写入权限, 请使用 sudo 再次运行此脚本"
fi

# 开始复制 c++
cp ./device/libstdc++.* $xcode_device_path
cp ./simulators/libstdc++.* $xcode_simulators_path
cp ./runtime/libstdc++.* $xcode_runtime_path
echo '安装完成'