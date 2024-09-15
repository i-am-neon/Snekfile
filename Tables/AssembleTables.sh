#!/bin/bash

# Run table manager using Wine
wine TableManager.exe TableOptions.s TableInstaller.event --error_on_missing

# Optional pause equivalent
if [[ "$1" != "noPause" ]]; then
  read -rp "Press Enter to continue..."
fi
