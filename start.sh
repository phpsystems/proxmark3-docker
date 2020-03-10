#!/bin/bash

# pull latest commits from GitHub
git pull

# Cleanup source directories
make clean

# Add in the BTADDON.
cat > Makefile.platform << EOF
# If you want to use it, copy this file as Makefile.platform and adjust it to your needs
# Run 'make PLATFORM=' to get an exhaustive list of possible parameters for this file.

PLATFORM=PM3RDV4
# If you want more than one PLATFORM_EXTRAS option, separate them by spaces:
PLATFORM_EXTRAS=BTADDON
STANDALONE=LF_ICERUN
EOF

# compile all
make all

# cd into Client
cd client

echo "-|"
echo "-+----------------------------------------------+-"
echo "-| RRG fork, docker container version 2.0.0     |-"
echo "-+----------------------------------------------+-"
echo "-|"
echo "-| You can now *flash* the device or run the client"
echo "-|"
echo "-|   ./pm3-flash /dev/ttyACM0 ../armsrc/obj/fullimage.elf"
echo "-|"
echo "-| or"
echo "-|"
echo "-|  ./client/proxmark3 /dev/ttyACM0"
echo "-|"
echo "-|"
