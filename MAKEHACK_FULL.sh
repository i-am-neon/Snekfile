#!/bin/bash

# Get the current directory
currDir="$(cd "$(dirname "$0")" && pwd)"

echo "--------------------------------------------------------"
echo "Assembling everything and building ROM... Please wait..."
echo "--------------------------------------------------------"

# Change to the Text directory and assemble text
cd "$currDir/Text"
echo "Assembling text..."
./AssembleText.sh

# Change to the Tables directory and assemble tables
cd "$currDir/Tables"
echo "Assembling tables..."
./AssembleTables.sh

# Return to the base directory and run MAKEHACK
cd "$currDir"
./MAKEHACK.sh

# Pause to keep the terminal open
read -p "Press any key to continue..."
