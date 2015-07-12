#!/bin/bash

#This script is only an example of how to use "expect" in "bash"

/usr/bin/expect << EOD
spawn rsync -ar ${line} ${desthost}:${destpath}
	expect "*?assword:*"
	send "${password}\r"
expect eof
EOD

exit 0
