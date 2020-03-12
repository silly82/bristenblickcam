#!/bin/bash
HOST_name='$sample.com'
USER='$suser'
PW='$pass'

ftp -n -v $HOST_name << EOT
ascii
user $USER $PW
prompt
 put /var/www/html/webcam.jpg /$url/weather/image.jpg

EOT
