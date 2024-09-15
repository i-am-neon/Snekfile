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

# Get the current working directory
currDir="$(cd "$(dirname "$0")" && pwd)"

# Absolute path to the ups directory
UPS_DIR="$currDir/ups"

# Copy our clean ROM to overwrite our edited ROM, so EA has a clean ROM to work with.
cp "$INPUT" "$OUTPUT"

# Move our working directory to EA's folder.
cd "$currDir/Event Assembler" || {
  echo "Failed to change directory to Event Assembler"
  exit 1
}

# Use Wine to run Event Assembler .exe on our copy of FE8 clean with our buildfile master.
wine Core.exe A FE8 "-output:$WINE_OUTPUT" "-input:$WINE_MASTER"

# Autogenerate a UPS patch of our newly assembled ROM.
# Use the ups.exe from the ups directory, but output New.ups to the top level
cd "$UPS_DIR" || {
  echo "Failed to change directory to UPS_DIR"
  exit 1
}

# Run UPS patch generation using ups.exe, output to the top-level directory
wine ups.exe diff -b "$WINE_INPUT" -m "$WINE_OUTPUT" -o "$WINE_UPS_OUTPUT"
