#!/bin/bash

#add port 443 to end of line for each domain
sed '/:[0-9]*$/ ! s/$/:443/' domains.txt > .temp.txt

#Run sslscan and output it a text file
for domain in $(cat .temp.txt); do echo -e "$domain\n" && sslscan --connect-timeout 5 $domain | tee sslscan.$domain.txt; echo '####################'; done
rm .temp.txt

#create dated folder and add results
now=$(date +"%m_%d_%Y")
mkdir "sslscan.results.$now"

mv sslscan.*.txt "sslscan.results.$now" 
