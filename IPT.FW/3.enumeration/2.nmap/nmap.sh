#!/bin/bash
#Vove the all hosts file temporarily so they don't get scanned again 
mv ../hosts/all_hosts.txt ../

FILES=../hosts/*
for SUBNET in $FILES
do
	sudo nmap -n --excludefile ../exclude.txt -p 21,22,23,25,80,135,139,389,443,445,636,902,1158,1433,1521,3306,3389,5432,5800,5900,6000,8080,8443,50000 -iL ${SUBNET} -oA $(basename ${SUBNET})_nmap
done
#put the all hosts file back where it belongs
mv ../all_hosts.txt ../hosts/
#Run the parse hosts script
echo Running parse script automatically.
bash ./.parse.sh
