#!/bin/bash


YEAR=$(date +"%Y")
MONTH=$(date +"%m")

git config --global user.email "${ahire.pawan@gmail.com}"
git config --global user.name "${PawanAhire}"

git config --global push.default simple

export GIT_TAG=V2.$YEAR-$MONTH.$TRAVIS_BUILD_NUMBER

msg="Tag Generated from TravisCI for build $TRAVIS_BUILD_NUMBER"

echo "$msg" >> ./build/Release-iphoneos/ProgressDemo.ipa

git add ./build/Release-iphoneos/ProgressDemo.ipa
git commit -m "Update build version file with $TRAVIS_BUILD_NUMBER"
