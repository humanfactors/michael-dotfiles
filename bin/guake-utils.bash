#!/bin/bash

echo

if [ "$1" == "restore" ]; then
    echo "Restoring Guake..."
    PARENT=$(xwininfo -name "Guake!" -int -tree | sed -ne '/Root/s/[^0-9]//gp')
    xdotool search --name "Guake!" windowreparent $PARENT
    echo "Done!"

elif [ "$1" == "import" ]; then 
    echo "Importing preferences from ~/.guake"
    gconftool-2 --load "$HOME/.guake/config.xml"
    gconftool-2 --load "$HOME/.guake/schema.xml"
    echo "Done!"

elif [ "$1" == "export" ]; then
    echo "Exporting preferences to ~/.guake"
    gconftool-2 --dump /apps/guake > "$HOME/.guake/config.xml"
    gconftool-2 --dump /schemas/apps/guake > "$HOME/.guake/schema.xml"
    echo "Done!"

else
    echo "Error: Command not recognised"
    echo
    echo "- restore - Restores Guake when minimised (Issue #45)"
    echo "- import - Imports Guake settings from ~/.guake"
    echo "- export - Exports Guake settings to ~/.guake"
fi

echo
