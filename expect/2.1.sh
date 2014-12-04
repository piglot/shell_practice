#!/bin/bash

rm -f /root/.ssh/id_rsa*

#!/usr/bin/expect -f
expect << EOF
spawn ssh-keygen -t rsa
expect "save the key (/root/.ssh/id_rsa):"
send "\n"

expect "(empty for no passphrase):"
send "\n"

expect "Enter same passphrase again:"
send "\n"

expect eof
EOF

#if [[ `cp ~/.ssh/id_rsa.pub /cloud/keys/` -eq 0 ]];then
#   echo 'copy id_rsa.pub complete.'
#fi

