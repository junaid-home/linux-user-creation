# Text styles
bold=$(tput bold)
dim=$(tput dim)
italic='\033[3m'
underline='\033[4m'
blinking='\033[5m'
reverse='\033[7m'
invisible='\033[8m'
default=$(tput sgr0)

# Forground colors
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

# Background colors
redbg=$(tput setab 1)
greenbg=$(tput setab 2)
yellowbg=$(tput setab 3)
bluebg=$(tput setab 4)
magentabg=$(tput setab 5)
cyanbg=$(tput setab 6)
whitebg=$(tput setab 7)

# symbols
error='✖'
info='ℹ'
warning='⚠'
success='✔'