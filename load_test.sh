#!/bin/bash
# ./load_test.sh path_to_the_apk device_serialno username:password
   i=0
   capk_path="Phone.apk"
   #device_serial="9aac0d89"
   login="auto@gmail.com:qwerty"
    timestamp=$(date +"%m-%d-%Y")
    DIR="/public_html/$timestamp"
   # HOST="mobileappmonitor"
    HOST="mbtest.comuv.com"
    #USER="a8455362"
    USER="a7982787"
   # PASS="saikrishna321"
   PASS="bharatesh1"
    ARRAY_TIME=
    ARRAY_STATUS=

    bash ./ftp.sh

   calabash-android resign $apk_path
   BASEDIR=$(dirname $0)
   mkdir -p $BASEDIR/results/$timestamp
   #mkdir -p /Users/tesco/Google Drive/Phone Results/$timestamp
   current_date_before=$(date +"%d")
for (( ; ; ))
do
   timestamp_report=$(date +"%m-%d-%Y-%T")
   echo "Pres CTRL+C to stop..."
   echo "******Test Started-$i*******"
   sleep 1
   calabash-android run $apk_path --tags @sanity_load ADB_DEVICE_ARG=$device_serial --format html --out results/$timestamp/$timestamp_report:phone_sanity.html --format junit --out results LOGIN=$login
   i=$((i+1));
   errors=$(awk -F"\"" ' /errors/ {print $2} ' $BASEDIR/results/TEST-features-sanity_load.xml)
   failures=$(awk -F"\"" ' /failures/ {print $4} ' $BASEDIR/results/TEST-features-sanity_load.xml)
   if [ $errors -eq '0' -a $failures -eq '0' ]
    then
      echo 'Test Pass'
      ARRAY_STATUS+=('|Pass ')
     else
      echo 'Test Fail'
      ARRAY_STATUS+=('|Fail ')
     fi
   string_text=$timestamp_report${ARRAY_STATUS[$i]}
   ARRAY_TIME+=$string_text
   #ARRAY_TIME+=($timestamp_report "pass")
   #ARRAY_STATUS+=('Pass')
   ftp -in -u ftp://a8455362:saikrishna321@mobileappmonitoring.site11.com/public_html/sanity_reports/android_phone/$timestamp/$timestamp_report:phone_sanity.html $BASEDIR/results/$timestamp/$timestamp_report:phone_sanity.html
   echo ${ARRAY_TIME[$i]}
   echo ${#ARRAY_TIME[@]}
   echo '******End Test*******'
   sleep 2
   current_date=$(date +"%d")
   if [ $current_date_before -eq $current_date ]
    then
    echo 'in continue block'
    #ruby ./api/report.rb ${ARRAY_TIME} ${ARRAY_STATUS}
    ruby ./api/report_generator.rb ${ARRAY_TIME[@]}
    ftp -in -u ftp://a8455362:saikrishna321@mobileappmonitoring.site11.com/public_html/sanity_reports/android_phone/dashboard/android_phone.html $BASEDIR/results/reports_sanity-android_phone.html
    #ruby ./api/xml_parse.rb $timestamp_report
    #ruby ./api/xml_parse.rb
    continue
    else
    echo 'in break block'
    bash ./load_test.sh
   fi
done

