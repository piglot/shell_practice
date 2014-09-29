#!/bin/bash
#This is a script practicing the format print 'printf'

printf '%s\t %s\t %s\t %s\t %s \n' $(cat printf.txt)
printf '%3s %5i %5i %5i %8.2f \n' $(cat printf.txt | grep -v English )
printf '\x45\n' 
