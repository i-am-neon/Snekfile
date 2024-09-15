#!/bin/bash

# Get the current working directory
currDir="$(cd "$(dirname "$0")" && pwd)"

# Define the ROM file
romFile="$currDir/Clean.gba"

# Check if the ROM file exists
if [[ ! -f "$romFile" ]]; then
  echo "Error: Clean.gba not found in the directory $currDir"
  exit 1
fi

# Run disassembly commands with Core.exe using Wine
wine ../Core.exe D FE8 Structure 0x9E863C -input:"$romFile" "-output:${currDir}/Prologue.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E879C -input:"$romFile" "-output:${currDir}/Ch1.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E8934 -input:"$romFile" "-output:${currDir}/Ch2.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E8A38 -input:"$romFile" "-output:${currDir}/Ch3.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E8B20 -input:"$romFile" "-output:${currDir}/Ch4.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E8C54 -input:"$romFile" "-output:${currDir}/Ch5.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E8D0C -input:"$romFile" "-output:${currDir}/Ch5x.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E8DC4 -input:"$romFile" "-output:${currDir}/Ch6.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E8E70 -input:"$romFile" "-output:${currDir}/Ch7.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E8FE4 -input:"$romFile" "-output:${currDir}/Ch8.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EC3B4 -input:"$romFile" "-output:${currDir}/LordsSplit.event" -addEndGuards

# Disassemble Ephraim and Eirika Routes
wine ../Core.exe D FE8 Structure 0x9E9140 -input:"$romFile" "-output:${currDir}/Ch9Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E92B0 -input:"$romFile" "-output:${currDir}/Ch10Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E9400 -input:"$romFile" "-output:${currDir}/Ch11Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E94E8 -input:"$romFile" "-output:${currDir}/Ch12Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E95E8 -input:"$romFile" "-output:${currDir}/Ch13Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E97B0 -input:"$romFile" "-output:${currDir}/Ch14Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E9A00 -input:"$romFile" "-output:${currDir}/Ch15Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E9B18 -input:"$romFile" "-output:${currDir}/Ch16Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E9CB4 -input:"$romFile" "-output:${currDir}/Ch17Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E9DA8 -input:"$romFile" "-output:${currDir}/Ch18Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9E9F08 -input:"$romFile" "-output:${currDir}/Ch19Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EA02C -input:"$romFile" "-output:${currDir}/Ch20Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EA138 -input:"$romFile" "-output:${currDir}/Final1Eir.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EA1C0 -input:"$romFile" "-output:${currDir}/Final2Eir.event" -addEndGuards

# Ephraim Route
wine ../Core.exe D FE8 Structure 0x9EA348 -input:"$romFile" "-output:${currDir}/Ch9Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EA4A8 -input:"$romFile" "-output:${currDir}/Ch10Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EA5BC -input:"$romFile" "-output:${currDir}/Ch11Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EA6CC -input:"$romFile" "-output:${currDir}/Ch12Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EA850 -input:"$romFile" "-output:${currDir}/Ch13Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EAACC -input:"$romFile" "-output:${currDir}/Ch14Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EACF0 -input:"$romFile" "-output:${currDir}/Ch15Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EAE2C -input:"$romFile" "-output:${currDir}/Ch16Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EAFC8 -input:"$romFile" "-output:${currDir}/Ch17Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EB0BC -input:"$romFile" "-output:${currDir}/Ch18Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EB21C -input:"$romFile" "-output:${currDir}/Ch19Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EB340 -input:"$romFile" "-output:${currDir}/Ch20Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EB44C -input:"$romFile" "-output:${currDir}/Final1Eph.event" -addEndGuards
wine ../Core.exe D FE8 Structure 0x9EB4D4 -input:"$romFile" "-output:${currDir}/Final2Eph.event" -addEndGuards

# Optional pause equivalent
read -rp "Press Enter to continue..."
