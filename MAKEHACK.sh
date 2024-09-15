#!/bin/bash

# Define input, output, and master file paths
INPUT="$(dirname "$0")/Clean.gba"
OUTPUT="$(dirname "$0")/New.gba"
OUTPUT_UPS="$(dirname "$0")/New.ups"
MASTER="$(dirname "$0")/Master.event"
# You can change these filenames to whatever you like. Don't change "$(dirname "$0")", though!

echo "---------------------------"

# Get the current working directory
currDir="$(dirname "$0")"

# Copy our clean ROM to overwrite our edited ROM, so EA has a clean ROM to work with.
cp "$INPUT" "$OUTPUT"

# Move our working directory to EA's folder.
cd "$currDir/Event Assembler" || exit

echo "---------------------------"
echo "Assembling ROM. Please wait..."
echo "---------------------------"

# Use Wine to run Event Assembler .exe on our copy of FE8 clean with our buildfile master.
wine Core.exe A FE8 "-output:$OUTPUT" "-input:$MASTER"

# Autogenerate a ups patch of our newly assembled ROM.
cd "$currDir/ups" || exit
wine ups.exe diff -b "$INPUT" -m "$OUTPUT" -o "$OUTPUT_UPS"

# Optional pause equivalent (if you need it)
if [[ "$1" != "noPause" ]]; then
  read -rp "Press Enter to continue..."
fi
