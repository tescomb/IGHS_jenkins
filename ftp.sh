#!/bin/bash
 timestamp=$(date +"%m-%d-%Y")
DIR="/public_html/sanity_reports/android_phone/$timestamp"
HOST="mobileappmonitoring.site11.com"
USER="a8455362"
PASS="saikrishna321"

ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS ${PASS}
mkdir ${DIR}
END_SCRIPT

