#!/bin/bash

# Run text processing using Wine
wine text-process-classic.exe TextBuildfile.event --parser-exe ParseFile.exe

# Optional pause equivalent
if [[ "$1" != "noPause" ]]; then
  read -rp "Press Enter to continue..."
fi
