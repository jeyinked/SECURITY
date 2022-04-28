#!/bin/bash

# ./brainfw.sh {action} [blockformat} {target}

# {action} -> bloque ou autorise 
# {blockformat} -> ip add, iprange ou pays 
# {target} -> 192.168.x.x, 192.168.x.x/24 or DE/FR

############################################################################################################################################################################

WOKPLACE="/root/temp"
ACTION="$1"
BLOCKFORMAT="$2"
TARGET="$3"
