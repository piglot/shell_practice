#!/usr/bin/expect

set timeout 60
set host 10.239.131.215
set name root
set password zaq12wsx

spawn ssh $name@$host
#expect
#{
#   "(yes/no)?"{
#      send "yes\n"
#      expect "password:"
#      send "$password\n"
#      }
#   "password:"{
#     send "$password\n"
#      }
#}
expect "password:"
send "$password\n"

expect "#"
send "uname\n"
expect "Linux"
send_user "Now you can do some operation on this terminal\n"
expect "#"
send "exit\n"

interact

