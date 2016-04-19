set -ev

sudo apt-get install openjdk-7-jdk

# Get Android NDK
if [ `uname -m` = x86_64]; then wget http://dl.google.com/android/ndk/android-ndk-r10d-linux-x86_64.bin -O ndk.bin; else wget http://dl.google.com/android/ndk/android-ndk-r10d-linux-x86.bin -O ndk.bin; fi
chmod a+x ndk.bin
#- ./ndk.bin -y | grep -v Extracting
./ndk.bin 1> /dev/null 2>&1