#!/bin/bash

##############################Generator Password####################################
ftppass='date | md5sum | cut -c 1-8'
today='date +"%D"'
echo -e "Dear All,\n\n\tNew password FTP KSC @USA to day $today information below.\n\t**IP : 113.21.240.138\n\t**Account : ksc-customer\n\t**Password : $ftppass\n\nThank You." > /tmp/change_password_ftp.txt
echo $ftppass | passwd ksc-customer --stdin
echo "Change Password: ksc-customer [Done.]"

#################################Clear Content######################################
rm -rf /home/ksc-customer/*
echo "Clear Content: /home/ksc-customer [Done.]"

#################################Send Password######################################
mailx -s "Reset Password Account KSC FTP @USA" -r sysadmin@ksc.net -c sysadmin@ksc.net network@ksc.net < /tmp/change_password_ftp.txt
echo "Send Mail: sysadmin@ksc.net [Done.]"

exit
