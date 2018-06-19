#!/bin/bash
{
	sed 's/#autologin-user=/autologin-user=root/g' -i /etc/lightdm/lightdm.conf
	sed 's/#autologin-user-timeout=0/autologin-user-timeout=0/g' -i /etc/lightdm/lightdm.conf
	sed 's/auth required pam_succeed_if.so user \!\= root quiet_success/#auth required pam_succeed_if.so user \!\= root quiet_success/g' -i /etc/pam.d/lightdm-autologin
} &> /dev/null
echo "Well Done!"
exit 1
