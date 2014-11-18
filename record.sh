#!/bin/sh
sleep 5
adb -s 04e894d29f5d39e4 shell screenrecord /sdcard/calabash.mp4 &
calabash-android run AvocadoSmoothie_8July2014_Sprint3.apk LOGIN=nav2@shop.com:qwerty
# osascript record.script &