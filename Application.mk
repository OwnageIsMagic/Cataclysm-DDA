#APP_ABI := arm64-v8a
APP_ABI := armeabi-v7a
#APP_STL := gnustl_static 
APP_STL := c++_static
NDK_TOOLCHAIN_VERSION := clang
##gnustl_static 
##stlport_shared c++_shared ##gabi++_shared
##ABI := all
#APP_PLATFORM := android-22
APP_PIE := true
#APP_CPPFLAGS += -frtti -fexceptions
