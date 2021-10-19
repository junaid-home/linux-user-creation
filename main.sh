#!/usr/bin/env bash

clear

source './variables.sh'
source './logo.sh'
source './header.sh'

USER=$(id -un)

if [[ $USER != "root" ]]
then
    echo -e "$red$bold$error [ ERROR ]$italic Only root user can run this script!$default"
    echo -e "$blue$bold$info [ INFO ]$default$blue Please run this script as$magenta$bold sudo$default"
    exit 1
fi