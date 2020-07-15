#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	JAMF-EXT-ShinyMetal.sh
#	https://github.com/Headbolt/JAMF-EXT-ShinyMetal
#
#   This Script is designed for use in JAMF as an Extension Attribute
#		with a type set of "Integer"
#
#   - This script will ...
#       Look Inside the Google Chrome App and pull out the version number.
#		Then Split the number down to get the Major Version Number.
#
###############################################################################################################################################
#
# HISTORY
#
#   Version: 1.0 - 15/07/2020
#
#   - 15/07/2020 - V1.0 - Created by Headbolt
#
###############################################################################################################################################
#
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
ChromeVers=$(defaults read "/Applications/Google Chrome.app"/Contents/Info CFBundleShortVersionString) # Extracts the Version from the APP
#
if [[ $ChromeVers == "" ]] # Checks if result is blank, ie App Not Present
	then
		ChromeMajorVers=$(/bin/echo "0") # If App is Not Present set the returned value to 0 
	else
		IFS='.' # Internal Field Seperator Delimiter is set to Dot (.)
		ChromeMajorVers=$(echo $ChromeVers | awk '{ print $1 }') # Splits down the Version Number to extracts the Major Version Number
		unset IFS # Internal Field Seperator Delimiter re-disabled
fi
#
/bin/echo "<result>$ChromeMajorVers</result>" # Return Result
