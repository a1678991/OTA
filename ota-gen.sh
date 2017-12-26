#!/bin/bash
device=z2_plus
cd /build/OTA/
oldzip=$(grep "<Filename>RR-N" $device.xml  | sed -e 's|</\?Filename>||g')
newzip=$1
sed -i "s/$oldzip/$newzip/g" $device.xml
cd -
cd /build/OTA
echo "OTA Update for RR $device $(date +%Y%m%d) Build" > /tmp/rrota
git commit -as -F /tmp/rrota
git pull --no-edit origin master;
git push origin master
cd -
rm -fv /tmp/rrota
