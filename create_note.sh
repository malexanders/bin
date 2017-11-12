#!/bin/sh

# Create daily work note and open in atom
# If note already exists simply open in atom

DAILY_WORK_NOTE=$HOME/Dropbox/notes/work_notes/$(date "+%y_%m_%d").md

if [[ ! -f $DAILY_WORK_NOTE ]]; then
  echo "Created work note, opening..."
  touch $DAILY_WORK_NOTE
  atom $DAILY_WORK_NOTE
else
  echo "Daily note already exists, opening..."
  atom $DAILY_WORK_NOTE
fi

exit 0
