#!/bin/sh
TARGET=FMDB-staticlib
DIST=dist
xcodebuild -configuration "Release" -target "$TARGET" -sdk iphoneos
xcodebuild -configuration "Release" -target "$TARGET" -sdk iphonesimulator
# lipo
lipo -create build/Release-iphoneos/lib$TARGET.a build/Release-iphonesimulator/lib$TARGET.a -output ./lib$TARGET.a

# cleanup
if [ -e $DIST ]; then
  rm -r $DIST
fi

mkdir $DIST

# copy files
cp lib$TARGET.a $DIST
cp build/Release-iphoneos/include/$TARGET/*.h $DIST
