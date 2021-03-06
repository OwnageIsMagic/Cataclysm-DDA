#!/bin/bash
set -e
#set -ev
#set -v

#	Move to jni
#mv ../Cataclysm-DDA/ ../jni
if [[  $CI = "true" ]]; then 
mkdir jni &&
cd jni &&
mv ../*[^.jni.] ../.*[^.] . ;
fi

#	Decrypt keys
#openssl aes-256-cbc -K $encrypted_bef49239437d_key -iv $encrypted_bef49239437d_iv -in my-release-key.keystore.enc -out my-release-key.keystore -d
#gpg -o keystore.gpg --symmetric --cipher-algo AES256 --passphrase-file ~/nkey.b64 my-release-key.keystore
if [[ ! -e my-release-key.keystore ]]; then
echo $MYKEY | gpg -o my-release-key.keystore --passphrase-fd 0 keystore.gpg
fi

#	Build
make version
~/android-ndk-root/ndk-build -j8
cp com.cataclysmdda.andr-1-TEMPLATE.apk com.cataclysmdda.andr.apk

#	Move to APK
#rm -r assets
mkdir assets
zip -qor9 assets/resources.zip data/
mv ../libs/armeabi-v7a/cataclysm assets/executable
zip -u com.cataclysmdda.andr.apk assets/resources.zip assets/executable

#	Signing
#keytool -genkey -v -keystore my-release-key.keystore -alias key -keyalg RSA -keysize 2048 -validity 10000
jarsigner -storepass $PAS -digestalg SHA1 -sigalg SHA1withRSA -keystore my-release-key.keystore com.cataclysmdda.andr.apk key

#	Zipalign
#zipalign -v 4 com.cataclysmdda.andr.apk com.cataclysmdda.andr-ALIGNED.apk
