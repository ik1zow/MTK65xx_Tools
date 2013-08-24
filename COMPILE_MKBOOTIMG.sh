#!/bin/sh
#
# Script to compile mkbootimg and mkbootfs
#
#  Assuming the Android Source codes are in: RobyAndroidLatest
#
#  NOTE:
#
#  In case of your directory layout is different, check for a directory named libmincrypt, mkbootimg, cpio
#
#
TARGET_DIR=~/bin
#
cd RobyAndroidLatest/system/core/libmincrypt
gcc -c *.c  -I../include
ar rcs libmincrypt.a *.o
cd ../mkbootimg/
gcc mkbootimg.c -o mkbootimg -I../include ../libmincrypt/libmincrypt.a
cd ../cpio
gcc mkbootfs.c  -o mkbootfs -I../include
#
#
cd ..
#
# Copy it on destnation directory
#
if [ -x $TARGED_DIR ]; then
  echo Destination directory: $TARGET_DIR
else
  echo Creating Destination directory: $TARGET_DIR
  mkdir -p $TARGET_DIR
fi
#
cp cpio/mkbootfs mkbootimg/mkbootimg $TARGET_DIR
#
