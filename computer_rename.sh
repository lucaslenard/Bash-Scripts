#!/bin/sh

#gets current logged in user
computerName=$(ls -l /dev/console | awk '{ print $3 }')

#set all the name in all the places
scutil --set ComputerName "$computerName"
scutil --set LocalHostName "$computerName"
scutil --set HostName "$computerName"