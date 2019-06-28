#!/bin/bash
#
# 2019
#
# All this script does is to run the Installer Manifest on class IRISConfig.Installer.
# The class will be run on %SYS namespace as it should be. The user name and password used to load
# the installer class and run it must be specified on environment variables
# IRIS_USERNAME and IRIS_PASSWORD.

# This must not be used on production. This is a work around to have journaling working when
# working on Mac

# From now on, any error should interrupt the script
set -e

iris start iris

VerifySC='If $System.Status.IsError(tSC) { Do $System.Status.DisplayError(tSC) Do $zu(4,$j,1) } Else { Do $zu(4,$j,0) }'

printf "\n\nLoading Installer..."

# This, on the other hand, should never fail and as it depends on the existence of the previous class
# it may fail if it hasn't been loaded correctly. 
printf "%s\n%s\nzn \"%s\"\nSet tSC=\$system.OBJ.Load(\"%s\",\"ck\")\n$VerifySC\n" "$IRIS_USERNAME" "$IRIS_PASSWORD" "%SYS" "/opt/app/UKPartnerDay2019/Installer.cls" | irissession IRIS

# Running the installer...
printf "\n\nRunning Installer..."
printf "%s\n%s\n%s\n%s\n" "$IRIS_USERNAME" "$IRIS_PASSWORD" "zn \"%SYS\"" "Do ##class(IRISConfig.Installer).Install()" | irissession IRIS

iris stop iris quietly


