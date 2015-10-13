#!/bin/sh
#
OUT_FILE="Ack.plist" LICENSE_DIR="*.license"
if  [ -f $OUT_FILE ]; then	
	rm -rf $OUT_FILE
fi
echo '<?xml version="1.0" encoding="UTF-8"?>' >> $OUT_FILE 
echo '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">' >> $OUT_FILE 
echo '<plist version="1.0">' >> $OUT_FILE 
echo '<dict>' >> $OUT_FILE 
echo '<key>PreferenceSpecifiers</key>' >> $OUT_FILE 
echo '<array>' >> $OUT_FILE

for f in $LICENSE_DIR 
do
  #  echo "Processing $f file..." take action on each file. $f store
  #  current file name
  packageName=`echo $f | awk -F "." '{ print $1 }'`
  licenseText=`cat $f` 
  echo '<dict>' >> $OUT_FILE
  echo '<key>Title</key>' >> $OUT_FILE
  echo "<string>" >> $OUT_FILE 
  echo "-= $packageName =- &#xA;" >> $OUT_FILE
  echo "$licenseText" >> $OUT_FILE
  echo "</string>"  >> $OUT_FILE
  echo '<key>Type</key>' >> $OUT_FILE
  echo '<string>PSGroupSpecifier</string>' >> $OUT_FILE
  echo '<key>FooterText</key>'  >> $OUT_FILE
#  echo "<string>$licenseText</string>" >> $OUT_FILE
  echo "<string>=====================================</string>" >> $OUT_FILE
  echo '</dict>'  >> $OUT_FILE	    
done


echo '</array>' >> $OUT_FILE 
echo '<key>StringsTable</key>' >> $OUT_FILE
echo '<string>Acks</string>' >> $OUT_FILE 
echo '</dict>' >> $OUT_FILE
echo '</plist>' >> $OUT_FILE


