#!/bin/sh

#gets current logged in user
computerName=$(ls -l /dev/console | awk '{ print $3 }')

#set name in ComputerName, LocalHostName and HostName locations
scutil --set ComputerName "$computerName"
scutil --set LocalHostName "$computerName"
scutil --set HostName "$computerName"
