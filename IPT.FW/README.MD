# IPT Folder

This project helps to create a baseline of testing procedures that each internal penetration test should include. After the process has concluded, the pentester will have the ability to determine which path or vulnerabilities to pursue.

## Overview

The high-level overview of this process starts off by finding targets to relay credentials to, setting up the relay, and also capturing password hashes at the same time.

The next section starts the enumeration process and provides the pentester with a plethora of scripts to collect network information in a usable format. This information can be used to gain insight into the structure of the client’s network.

When the information from the previous step is collected, it can be used to conduct the Nessus vulnerability scan of the client’s network. 
Various other testing techniques are provided to help the pentester determine the path of compromise depending on the information gathered throughout the process.

## Project location
%%%%%

## Note

One thing to note is that you will need to edit the /etc/hosts file in the Kali Docker image for the Nmap scripts to work properly. Use the command below to add the line to the /etc/hosts file:
 
	echo '127.0.0.1 rpa-ctek' >> /etc/hosts
	echo '127.0.0.1 rpa-parrot-full' >> /etc/hosts

## Instructions
Navigating through each directory numerically in the IPT folder, there is a ‘1.commands.txt’ file that provides guidance on what to perform for each section. Once that section is completed you can move to the next folder in the IPT directory. Below are the current items in the folder structure.
1.	impacket
2.	mitm6
3.	enumeration
4.	nessus
5.	passwords
6.	kerberos
7.	bloodhound
8.	resources

