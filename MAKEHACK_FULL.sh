#!/bin/bash

# Get the current working directory
currDir="$(cd "$(dirname "$0")" && pwd)"

echo "--------------------------------------------------------"
echo "Assembling everything and building ROM... Please wait..."
echo "--------------------------------------------------------"

# Change to the Text directory and assemble text
cd "$currDir/Text" || exit
echo "Assembling text..."
./AssembleText.sh noPause

# Change to the Tables directory and assemble tables
cd "$currDir/Tables" || exit
echo "Assembling tables..."
./AssembleTables.sh noPause

# Return to the base directory and run MAKEHACK.sh
cd "$currDir" || exit
./MAKEHACK.sh noPause
