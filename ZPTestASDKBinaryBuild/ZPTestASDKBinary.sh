
# 合并在真机和模拟器上编译出的ZPTestASDK

# 项目名称
PROJECT_NAME="ZPTestASDK"
# 库名称
FMK_NAME=${PROJECT_NAME}
# 编译的TARGET名称
TARGET_NAME=${FMK_NAME}
# INSTALL_DIR 是导出framework的路径
# 在工程的根目录创建framework的文件夹.
INSTALL_DIR=Products
# 合成framework后，WRK_DIR会被删除
WRK_DIR=build
DEVICE_DIR=${WRK_DIR}/Release-iphoneos
SIMULATOR_DIR=${WRK_DIR}/Release-iphonesimulator
# framework资源文件
# FMK_NAME_BUNDLE="$PWD/${FMK_NAME}/Assets"
cd ZPTestASDKBinaryBuild
# 生成两个架构的framework
# -UseModernBuildSystem=NO 不是用新构建系统
# LIBRARY_SEARCH_PATHS 如果你的组件以来了某个第三方，需要设置一下这个
DEVICE_LIBRARY_SEARCH_PATHS="Pods/build/Release-iphoneos"
SIMULATOR_LIBRARY_SEARCH_PATHS="Pods/build/Release-iphonesimulator"
xcodebuild -configuration "Release" -workspace "${PROJECT_NAME}.xcworkspace" -scheme "${TARGET_NAME}" -sdk iphoneos clean build CONFIGURATION_BUILD_DIR="${DEVICE_DIR}" LIBRARY_SEARCH_PATHS="${DEVICE_LIBRARY_SEARCH_PATHS}" -UseModernBuildSystem=NO 
xcodebuild -configuration "Release" -workspace "${PROJECT_NAME}.xcworkspace" -scheme "${TARGET_NAME}" -sdk iphonesimulator clean build build CONFIGURATION_BUILD_DIR="${SIMULATOR_DIR}" LIBRARY_SEARCH_PATHS="${SIMULATOR_LIBRARY_SEARCH_PATHS}" -UseModernBuildSystem=NO
#删除之前生成的framework
if [ -d "${INSTALL_DIR}" ]
then
rm -rf "${INSTALL_DIR}"
fi
mkdir -p "${INSTALL_DIR}"
cp -R "${DEVICE_DIR}/" "${INSTALL_DIR}/"
# 找到所有bundle资源复制过去
# for file in `ls | find ${FMK_NAME_BUNDLE} -name '*.bundle'` ; do
# 	cp -R $file "${INSTALL_DIR}/${FMK_NAME}.framework"
# done
# 合成
lipo -create "${DEVICE_DIR}/${FMK_NAME}.framework/${FMK_NAME}" "${SIMULATOR_DIR}/${FMK_NAME}.framework/${FMK_NAME}" -output "${INSTALL_DIR}/${FMK_NAME}.framework/${FMK_NAME}"
# 删除 WRK_DIR
rm -r "${WRK_DIR}"
# 打开 INSTALL_DIR
# open "${INSTALL_DIR}"
