LOCAL_PATH := $(call my-dir)

#~/Загрузки/crystax-ndk-10.2.1/ndk-build V=1 -j6
#clear && echo ./configure --target arm-linux-androideabi --host arm-linux-androideabi --enable-widec CC="ccache /run/shm/armtoolchain/bin/arm-linux-androideabi-gcc" CXX="ccache /run/shm/armtoolchain/bin/arm-linux-androideabi-g++" &

include $(CLEAR_VARS)
LOCAL_MODULE := libncurses
LOCAL_SRC_FILES := $(LOCAL_PATH)/include/libncurses.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := cataclysm
LOCAL_SRC_FILES := $(wildcard src/*.cpp)
DEFINES += -DRELEASE #-DGIT_VERSION -DANDROID -DCATA_NO_CPP11_STRING_CONVERSIONS
	#GCC
#LOCAL_CPPFLAGS := -Wl,--dynamic-linker=/system/bin/linker -std=c++11 -DRELEASE -Wall -ffast-math -MMD -Ofast -fPIE -pie --static $(DEFINES) 
	#Clang
LOCAL_CPPFLAGS := -Wl,--dynamic-linker=/system/bin/linker -std=c++11 -fPIC -fPIE -pie -Ofast -flto=jobserver -fuse-ld=gold -fomit-frame-pointer -MMD $(DEFINES) 
#-Werror --static 
#-march=armv7-a -mfloat-abi=softfp
#LOCAL_LDFLAGS := --static -fPIE -pie -Wl,--dynamic-linker=/system/bin/linker
LOCAL_LDFLAGS += $(LOCAL_CPPFLAGS)
LOCAL_CPP_FEATURES := rtti exceptions
#-D_GLIBCXX_USE_INT128  -stdlib=libstdc++
#TARGET_ABI := android-22-arm64-v8a
TARGET_ARCH_ABI := armeabi-v7a
TARGET_PLATFORM := android-22
#TARGET_ABI := android-20-arm64-v8a
#-I/usr/include/ncursesw
#LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -lncursesw -ltinfo -lncurses  
#LOCAL_C_INCLUDES := include/
LOCAL_STATIC_LIBRARIES := libncurses
include $(BUILD_EXECUTABLE)
