#!/bin/sh

#$ adb devices|tail -n +2|cut -sf 1 > devices; parallel --no-notice --xapply -a devices echo calabash-android run apkfile  {1} LOGIN={2} ::: u1 u2
#> calabash-android run apkfile 0149CC3B0F006018 LOGIN=u1
#> calabash-android run apkfile TA93305TOE LOGIN=u2
APK=$1
shift
adb devices|tail -n +2|cut -sf 1 > .devices_android; parallel --no-notice --xapply -a .devices_android -a .tags calabash-android run ${APK} --tags {2} ADB_DEVICE_ARG={1} --format html --out {2}.html --format 'Slowhandcuke::Formatter' LOGIN={3} ::: $@
rm .devices_android
