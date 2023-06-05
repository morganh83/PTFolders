#!/bin/bash

for i in `cat ../subnets.txt`
do
	x=$(echo $i | cut -d'/' -f1)
	sudo nmap -sn -n --excludefile ../exclude.txt -PE $i -oA $(basename ${x})_pingsweep
done
 
ruby ./.clean.rb
ifconfig | grep netmask -B 3
echo Verify that your IP has been removed from the lists!
