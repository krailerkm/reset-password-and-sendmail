#!/bin/bash

##############################Generator Password####################################
ftppass='date | md5sum | cut -c 1-8'
today='date +"%D"'
echo -e "Dear All,\n\n\tNew password FTP @USA to day $today information below.\n\t**IP : 192.168.0.1\n\t**Account :my-customer\n\t**Password : $ftppass\n\nThank You." > /tmp/change_password_ftp.txt
echo $ftppass | passwd my-customer --stdin
echo "Change Password: my-customer [Done.]"

#################################Clear Content######################################
rm -rf /home/ksc-customer/*
echo "Clear Content: /home/ksc-customer [Done.]"

#################################Send Password######################################
mailx -s "Reset Password Account FTP @USA" -r sysadmin@my.net -c sysadmin@my.net network@my.net < /tmp/change_password_ftp.txt
echo "Send Mail: sysadmin@my.net [Done.]"

exit
