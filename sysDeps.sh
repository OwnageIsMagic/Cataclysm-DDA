#!/bin/bash
#set -ev
set -e

#	apt-get
#sudo apt-get update 1>/dev/null 2>&1
#sudo apt-get install openjdk-7-jdk
#sudo apt-get install zipalign

#	Get Android NDK
if [[ ! -e ~/android-ndk-root/ndk-build ]]; then
	wget dl.google.com/android/repository/android-ndk-r11c-linux-x86_64.zip -O ~/ndk.zip &&
	unzip ~/ndk.zip -d ~ 1>/dev/null &&
	mv ~/android-ndk-r11c ~/android-ndk-root;
fi
