#!/bin/bash

# Define input, output, and master file paths using absolute Unix-style paths for Wine
INPUT="$(dirname "$0")/Clean.gba"
OUTPUT="$(dirname "$0")/New.gba"
OUTPUT_UPS="$(dirname "$0")/New.ups" # Output New.ups in top-level directory
MASTER="$(dirname "$0")/Master.event"
WINE_INPUT=$(winepath -w "$INPUT")           # Convert to Windows-style path for Wine
WINE_OUTPUT=$(winepath -w "$OUTPUT")         # Convert to Windows-style path for Wine
WINE_MASTER=$(winepath -w "$MASTER")         # Convert to Windows-style path for Wine
WINE_UPS_OUTPUT=$(winepath -w "$OUTPUT_UPS") # Convert to Windows-style path for UPS output

# Log paths
echo "INPUT: $INPUT"
echo "OUTPUT: $OUTPUT"
echo "OUTPUT_UPS: $OUTPUT_UPS"
echo "MASTER: $MASTER"
echo "WINE_INPUT: $WINE_INPUT"
echo "WINE_OUTPUT: $WINE_OUTPUT"
echo "WINE_MASTER: $WINE_MASTER"
echo "WINE_UPS_OUTPUT: $WINE_UPS_OUTPUT"

echo "---------------------------"

# Get the current working directory
currDir="$(cd "$(dirname "$0")" && pwd)"
echo "Current working directory: $currDir"

# Absolute path to the ups directory
UPS_DIR="$currDir/ups"
echo "UPS_DIR path: $UPS_DIR"

# Log directory contents
echo "Contents of current directory:"
ls "$currDir"

# Copy our clean ROM to overwrite our edited ROM, so EA has a clean ROM to work with.
echo "Copying Clean.gba to New.gba"
cp "$INPUT" "$OUTPUT"

# Move our working directory to EA's folder.
cd "$currDir/Event Assembler" || {
  echo "Failed to change directory to Event Assembler"
  exit 1
}
echo "Changed directory to: $(pwd)"

# Log directory contents
echo "Contents of Event Assembler directory:"
ls

echo "---------------------------"
echo "Assembling ROM. Please wait..."
echo "---------------------------"

# Use Wine to run Event Assembler .exe on our copy of FE8 clean with our buildfile master.
# Pass the paths in Windows-style to Wine
wine Core.exe A FE8 "-output:$WINE_OUTPUT" "-input:$WINE_MASTER"

# Autogenerate a UPS patch of our newly assembled ROM.
# Use the ups.exe from the ups directory, but output New.ups to the top level
echo "Changing directory to UPS_DIR: $UPS_DIR"
cd "$UPS_DIR" || {
  echo "Failed to change directory to UPS_DIR"
  exit 1
}

# Log directory contents
echo "Contents of UPS_DIR:"
ls

# Run UPS patch generation using ups.exe, output to the top-level directory
wine ups.exe diff -b "$WINE_INPUT" -m "$WINE_OUTPUT" -o "$WINE_UPS_OUTPUT"

# Optional pause equivalent (if you need it)
if [[ "$1" != "noPause" ]]; then
  read -rp "Press Enter to continue..."
fi
