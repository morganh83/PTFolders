#!/bin/bash
echo "You may need to use nslookup or other methods to find ALL domain controllers."
echo "Exampe: nslookup !client.domain!"
echo
echo "Do you understand? [y/n]"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then


cat ../hosts/ldap_hosts.txt | while read line
do 
	enum4linux -a $line | tee null.sessions.$line.txt
done

# Find shares with enum4linux
cat ../hosts/smb_hosts.txt | while read line
do
	enum4linux -S $line | tee shares.enum4linux.$line.txt
done

# Find shares with smbclient
cat ../hosts/smb_hosts.txt | while read line
do
	smbclient -L \\$line -U ""%"" | tee shares.smbclient.$line.txt
done

else
	exit
fi

