#!/bin/bash
#
# ------------------------------------------------------------------$
# This script capable to executed from cron, capturing camera image,
# modifing the exposure on Sunrise and Sunset Time
# ------------------------------------------------------------------$
#
SUNRISE=$(sunwait poll 47.825N 8.649E)
#SUNRISE=$(echo "$SUNRISE" | cut -b1-2):$(echo "$SUNRISE" | cut -b3-4):00
#SUNSET=$(sunwait -p 47N 9E 2>&1 | grep 'Sun rises' | cut -d' ' -f 25)
#SUNSET=$(echo "$SUNSET" | cut -b1-2):$(echo "$SUNSET" | cut -b3-4):00
#echo "$SUNRISE"
DATENOW="$(date +%H:%M:%S)"
#echo "$DATENOW"
if [[ "$SUNRISE" = "DAY" ]]; then
   # gphoto2 --set-config /main/capturesettings/exposurecompensation=15
echo Normalbelichtung
else
    #gphoto2 --set-config /main/capturesettings/exposurecompensation=30
echo überbelichtung
fi
sleep 10
#echo Klick
gphoto2 --capture-image-and-download --filename "/var/www/html/webcam.jpg" --force-overwrite
