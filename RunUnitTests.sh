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

irissession IRIS

# Running the Unit Tests...
printf "\n\nRunning Unit Tests..."
printf "%s\n%s\n%s\n%s\n" "_SYSTEM" "SYS" "zn \"DEMO\"" "Do ##class(Testing.WordGameTests).Run(1)" | irissession IRIS