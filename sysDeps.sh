set -ev

#sudo apt-get install openjdk-7-jdk

# Get Android NDK
if [[ ! -e android-ndk-root/ndk-build ]]; then wget dl.google.com/android/repository/android-ndk-r11c-linux-x86_64.zip -O ndk.zip && unzip ndk.zip && mv android-ndk-r11c android-ndk-root; fi
