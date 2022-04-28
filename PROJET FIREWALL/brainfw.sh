#!/bin/bash

# ./brainfw.sh {action} [blockformat} {target}

# {action} -> bloque ou autorise 
# {blockformat} -> ip add, iprange ou pays 
# {target} -> 192.168.x.x, 192.168.x.x/24 or DE/FR

####################################################################[VARIABLES G]##################################################################################

WOKPLACE="/root/temp"
ACTION="$1"
BLOCKFORMAT="$2"
TARGET="$3"

function check_workplace()
{
        WORKPLACE="$1"
        if [[ ! -e "$WORKPLACE" ]]
        then
                 echo "$WORKPLACE doesn't exist, creation..."
                  mkdir "$WORKPLACE"
        else
                 echo "$WORKPLACE is ok, processing... 
                  
}

function get_country()
{
}

function blockip()
{
}

function unblockip()
{
}

function core()
{
}

function action()
{
}
