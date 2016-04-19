#!/bin/sh
set -ev

#	Build
./android-ndk-root/ndk-build -j8
cp com.cataclysmdda.andr-1-TEMPLATE.apk com.cataclysmdda.andr.apk

#	Move to APK
rm -r assets
mkdir assets
zip -qor9 assets/resources.zip data/
mv ../libs/armeabi-v7a/cataclysm assets/executable
zip -u com.cataclysmdda.andr.apk assets/resources.zip assets/executable

#	Signing
#keytool -genkey -v -keystore my-release-key.keystore -alias key -keyalg RSA -keysize 2048 -validity 10000
jarsigner -digestalg SHA1 -sigalg SHA1withRSA -keystore my-release-key.keystore com.cataclysmdda.andr.apk key

#	Zipalign
#zipalign -v 4 com.cataclysmdda.andr.apk com.cataclysmdda.andr-ALIGNED.apk