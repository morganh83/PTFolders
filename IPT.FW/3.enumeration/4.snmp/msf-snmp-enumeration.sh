#!/bin/bash

msfconsole -r .msf-enumeration.rc
echo 
echo  
echo -n "Results are written to results.txt file."
sleep 3
cat *.txt | grep + > results.txt
echo
echo  "Done. Check results.txt file"
