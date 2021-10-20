#!/usr/bin/env bash

clear

source './variables.sh'
source './logo.sh'
source './header.sh'

USER=$(id -un)

if [[ $USER != "root" ]]
then
    echo -e " $red$bold$error [ ERROR ]$italic Only root user can run this script!$default"
    echo -e " $blue$bold$info [ INFO ]$default$blue Please run this script as$magenta$bold sudo$default"
    exit 1
fi

echo -ne " $bold$white${underline}Real Name$default$dim > "
read  REAL_NAME
echo -ne " $default$bold$white${underline}Username$default$dim > "
read USER_NAME
echo -ne " $default$bold$white${underline}Password$default$dim > "
read -s USER_PASSWORD

while true; do
    echo -ne "\n $default$bold$white${underline}Force User to change Password?$default$dim (Y/N) > "
    read yn
    case $yn in
        [Yy]* ) CHANGE_PASSWORD="Yes"; break;;
        [Nn]* ) CHANGE_PASSWORD="No"; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

useradd -c "$REAL_NAME" -m $USER_NAME 1>> log.out 2>> log.error

echo "$USER_NAME:$USER_PASSWORD" | chpasswd 1>> log.out 2>> log.error

if [[ $CHANGE_PASSWORD == "Yes" ]]
then
    passwd -e $USER_NAME 1>> log.out 2>> log.error;
fi

echo -e "\n\n"
echo -en "$default | $bold Real Name$default\t|"
echo -e "$default $italic $REAL_NAME$default\t|"

echo -en "$default | $bold Username$default\t|"
echo -e "$default $italic $USER_NAME$default\t|"

echo -en "$default | $bold Password$default\t|"
echo -e "$default $italic $USER_PASSWORD$default\t|"

echo -e "\n $green$success$bold [ OK ]$default$green$italic user successfully created!$default"

exit 0