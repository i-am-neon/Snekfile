#!/bin/bash

# Get the current working directory
currDir="$(cd "$(dirname "$0")" && pwd)"

# Define the ROM file path
romFile="$currDir/New.gba"

# Check if the ROM file exists
if [[ ! -f "$romFile" ]]; then
  echo "Error: New.gba not found in the directory $currDir"
  exit 1
fi

# Run assembly commands with Core.exe using Wine
wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/MyPrologue.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch1.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch2.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch3.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch4.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch5.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch5x.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch6.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch7.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch8.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/LordsSplit.event"

# # Ephraim and Eirika routes
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch9Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch10Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch11Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch12Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch13Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch14Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch15Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch16Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch17Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch18Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch19Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch20Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Final1Eir.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Final2Eir.event"

# # Ephraim route
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch9Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch10Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch11Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch12Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch13Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch14Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch15Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch16Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch17Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch18Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch19Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Ch20Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Final1Eph.event"
# wine Core.exe A FE8 -output:"$romFile" "-input:${currDir}/Final2Eph.event"

# Optional pause equivalent
read -rp "Press Enter to continue..."
