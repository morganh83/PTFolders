#!/bin/bash

API='' #put your API key here

if [ -z "$API" ]
then
      echo "Please put your API key into script and restart. Register here: https://wpscan.com/wordpress-security-scanner"; exit 1;
else
      echo ""
fi

#Colors variabel
NC='\033[0m'
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;040m'
ORANGE='\033[1;38;5;202m'
BLUE='\033[1;38;5;012m'
BLUE2='\033[1;38;5;032m'
PINK='\033[1;38;5;013m'
GRAY='\033[1;38;5;004m'
NEW='\033[1;38;5;154m'
YELLOW='\033[1;38;5;214m'
CG='\033[1;38;5;087m'
CP='\033[1;38;5;221m'
CPO='\033[1;38;5;205m'
CN='\033[1;38;5;247m'
CNC='\033[1;38;5;051m'
regex='^(https?)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]\.[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]$'

#Banner and version
Codename='Yeeaahh'
Vers=1.0.1#beta
LINK='https://github.com/sheimo'
function banner(){
echo -e ${CP}" 																			   "
echo -e ${CP}"  __      ____________    _________                                          "
echo -e ${CP}" /  \    /  \______   \  /   _____/ ____ _____    ____   ____   ___________  "
echo -e ${CP}" \   \/\/   /|     ___/  \_____  \_/ ___\\__  \  /    \ /    \_/ __ \_  __ \ "
echo -e ${CP}"  \        / |    |      /        \  \___ / __ \|   |  \   |  \  ___/|  | \/ "
echo -e ${CP}"   \__/\  /  |____|     /_______  /\___  >____  /___|  /___|  /\___  >__|    "
echo -e ${CP}"        \/                      \/     \/     \/     \/     \/     \/        "





echo -e "${BLUE2}A quick n' dirty WP Scanner"
}
#Main Menu
function Main_Menu(){
clear
banner
	echo ""
    echo -e "${CN}Author   : ${BLUE}Mr. Sheimo ($LINK)"
	echo -e "${CN}Codename : ${CPO}${Codename}"
	echo -e "${CN}Version  : ${BLUE}${Vers}"
	echo ""
	echo -e "  ${NC}[${CG}"1"${NC}]${CNC} WordPress Enumeration Scan"
	echo -e "  ${NC}[${CG}"2"${NC}]${CNC} WordPress User Enumeration"
	echo -e "  ${NC}[${CG}"3"${NC}]${CNC} Exit"
	
	echo ""
	echo -ne "${YELLOW}Input your choice: "; tput sgr0
read Menus
#Menu Function
if test "$Menus" == '1'
then
    WPEnumerate
elif test "$Menus" == '2'
then
	WPusers
elif test "$Menus" == '3'
then
    exit	
 else
    Main_Menu
    fi

}

function WPEnumerate(){
	echo -ne "${YELLOW}Input your site: (ex: https://example.com): "; tput sgr0
	read website

clear        
wpscan --url $website --random-user-agent  --api-token $API  -e --plugins-detection mixed;

}

function WPusers(){
	echo -ne "${YELLOW}Input your site: (ex: https://example.com): "; tput sgr0
	read website

clear        
wpscan --url $website --random-user-agent  --api-token $API  -e u;

}

Main_Menu
