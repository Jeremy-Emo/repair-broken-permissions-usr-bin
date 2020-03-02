#!/bin/bash

chown root:root /usr/bin
chmod 755       /usr/bin

chown root     /usr/bin/*
chown daemon   /usr/bin/at

find /usr/bin ! -name sudo -exec chmod 755 {} \;
chmod g+s /usr/bin/crontab
chmod g+s /usr/bin/mail-touchlock
chmod g+s /usr/bin/mail-lock
chmod g+s /usr/bin/dotlockfile
chmod u+s /usr/bin/lppasswd
chmod g+s /usr/bin/mail-unlock
chmod g+s /usr/bin/wall
chmod g+s /usr/bin/bsd-write
chmod g+s /usr/bin/chage
chmod g+s /usr/bin/screen
chmod g+s /usr/bin/mlocate
chmod ug+s /usr/bin/at
chmod g+s /usr/bin/ssh-agent
chmod g+s /usr/bin/expiry

(cat - <<EOF
-rwsr-xr-x   root     root    /usr/bin/traceroute6.iputils
-rwsr-xr-x   root     root    /usr/bin/passwd
-rwsr-sr-x   root     mail    /usr/bin/procmail
-rwsr-xr-x   root     root    /usr/bin/traceroute6
-rwsr-xr-x   root     root    /usr/bin/sudo
-rwsr-xr-x   root     root    /usr/bin/pkexec
-rwxr-sr-x   root     tty     /usr/bin/write
-rwsr-xr-x   root     root    /usr/bin/chsh
-rwxr-sr-x   root     mail    /usr/bin/lockfile
-rwsr-sr-x   root     root    /usr/bin/X
-rwsr-xr-x   root     root    /usr/bin/chfn
-rwsr-xr-x   root     root    /usr/bin/sudoedit
-rwsr-xr-x   root     root    /usr/bin/arping
-rwsr-sr-x   daemon   daemon  /usr/bin/atrm
-rwxr-sr-x   root     mlocate /usr/bin/locate
-rwsr-xr-x   root     root    /usr/bin/newgrp
-rwsr-sr-x   daemon   daemon  /usr/bin/atq
-rwsr-xr-x   root     root    /usr/bin/sg
-rwsr-xr-x   root     root    /usr/bin/mtr
-rwsr-xr-x   root     root    /usr/bin/gpasswd
EOF
) | while read P U G F
do
   if [ -f "$F" ]
   then
      case $P in
         -rws*) chmod u+s "$F" ;;&
         -???r-s*) chmod g+s "$F" ;;
      esac
   else
      echo "$F inconnu"
   fi
done

find /usr/bin -type l -exec chown -h root {} \;
chmod 644 /usr/lib/sudo/sudoers.so
