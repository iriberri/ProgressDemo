#!/bin/sh

#PROVISIONING_PROFILE="$HOME/Library/MobileDevice/Provisioning Profiles/$PROFILE_NAME.mobileprovision"
#OUTPUTDIR="$PWD/build/Release-iphoneos"

#xcrun -log -sdk iphoneos PackageApplication "$OUTPUTDIR/$APP_NAME.app" -o "$OUTPUTDIR/$APP_NAME.ipa" -sign "$DEVELOPER_NAME" -embed "$PROVISIONING_PROFILE"
#xcodebuild archive -project ProgressDemo.xcodeproj -scheme ProgressDemo -sdk iphoneos -configuration Release "$OUTPUTDIR/$APP_NAME.ipa" -sign "$DEVELOPER_NAME" -embed "$PROVISIONING_PROFILE"
#xcodebuild archive -project ProgressDemo.xcodeproj -scheme ProgressDemo -sdk iphoneos -configuration Release -derivedDataPath $OUTPUTDIR -archivePath $OUTPUTDIR/$APP_NAME.ipa

# Archive the application
xcodebuild \
-scheme "ProgressDemo" \
-sdk "iphoneos" \
-archivePath "$OUTPUTDIR/$APP_NAME.xcarchive" \
-configuration Release \
PROVISIONING_PROFILE="$PROVISIONING_PROFILE" \
archive 

# Export the archive to an ipa
xcodebuild \
-exportArchive \
-archivePath "$OUTPUTDIR/$APP_NAME.xcarchive" \
-exportOptionsPlist "scripts/exportOptions-Enterprise.plist" \
-exportPath "$OUTPUTDIR"

