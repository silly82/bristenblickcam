#!/bin/bash                                                          
#                                                                    
# ------------------------------------------------------------------$
# This script capable to executed from cron, capturing camera image, 
# copying localy and uploading that to a given FTP server            
# ------------------------------------------------------------------$
#                                                                    
# HUN: Idokep webkamera FTP feltoltes automatizalo script RaspberryPi
# szamitogephez, kozonseges fenykepezogep vezerlesere (Canon S5 IS   
# geppel tesztelve)                                                  
#                                                                    
# Before run install: sudo apt-get install gphoto2 usbmount          
                                                                     
SUNRISE=`sunwait -p 47N 9E 2>&1 | grep 'Sun rises' | cut -d' ' -f 22`
SUNRISE=`echo $SUNRISE | cut -b1-2`:`echo $SUNRISE | cut -b3-4`:00   
SUNSET=`sunwait -p 47N 9E 2>&1 | grep 'Sun rises' | cut -d' ' -f 25` 
SUNSET=`echo $SUNSET | cut -b1-2`:`echo $SUNSET | cut -b3-4`:00      
echo $SUNRISE                                                        
echo $SUNSET                                                         
                                                                     
DATENOW="$(date +%H:%M:%S)"                                          
echo $DATENOW                                                        
#if [[ "$DATENOW" < "17:40:00" && "$DATENOW" > "06:30:00" ]]; then   
if [[ "$DATENOW" < "$SUNSET" && "$DATENOW" > "$SUNRISE" ]]; then     
                                                                     
    gphoto2 --set-config /main/capturesettings/exposurecompensation=$
                                                                     
else                                                                 
    gphoto2 --set-config /main/capturesettings/exposurecompensation=$
                                                                     
fi                                                                   
                          [ Read 33 lines ]                          
^G Get Help  ^O Write Out ^W Where Is  ^K Cut Text  ^J Justify       
^X Exit      ^R Read File ^\ Replace   ^U Uncut Text^T To Linter
