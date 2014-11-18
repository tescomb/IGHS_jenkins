#!/bin/bash

#./live.sh apkpath deviceid username:password

calabash-android resign $1

calabash-android run $1 --tags @sanity_final --format html --out sanity_phone.html --format 'Slowhandcuke::Formatter' ADB_DEVICE_ARG=$2 LOGIN=$3