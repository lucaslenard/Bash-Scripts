#!/bin/bash

asset=$(curl -sku jamfadmin:jamf1234 -H "accept: text/xml" https://127.0.0.1:8443/JSSResource/computers/id/3000 | xmllint --xpath '/computer/general/asset_tag/text()' -)

if [[ $asset = "" ]]; then
	userValue=$(osascript << EOF
		text returned of (display dialog "Hello, please enter your asset tag" default answer "AT0000" buttons {"OK"} default button 1)
		EOF)
		sudo jamf recon -assetTag $userValue
	else 
	echo "You're good!"
fi


