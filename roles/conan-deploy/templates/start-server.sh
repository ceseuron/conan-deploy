#!/bin/bash
# Conan Exiles server initialization script.

tempmodpath="/home{{ conan_user }}/exiles/modtmp"
modpath="/home/{{ conan_user }}/exiles/ConanSandbox/Mods"
modlist="$modpath/modlist.txt"

# Die if the modlist.txt file does not exist.
if [[ ! -f $modlist ]]; then
  echo "Modlist.txt is missing from the mod path: $modpath"
  echo "Run ansible playbook to redeploy base configuration."
  exit 1
fi



