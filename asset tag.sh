#!/bin/bash

#Set Variables
username=""
password=""
url=""


#Gather device serial number
serial=$(system_profiler SPHardwareDataType | awk '/Serial Number/{print $4}') 

#Gather current asset tab using API
asset=$(curl -sku $username:$password -H "accept: text/xml" https://$url/JSSResource/computers/serialnumber/$serial | xmllint --xpath '/computer/general/asset_tag/text()' -)

#Prompt user to fill in Asset Tag if current value is empty

if [[ $asset = "" ]]; then

#Prompt user using osascript	
	userValue=$(osascript << EOF
		text returned of (display dialog "Hello, please enter your asset tag" default answer "AT0000" buttons {"OK"} default button 1)
		EOF)
		
#Update Jamf Pro by sending Asset tag via inventory update
		sudo jamf recon -assetTag $userValue
	else 
	echo "Asset tag already present"
fi


