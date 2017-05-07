#!/bin/bash

# Configure note extension (default: .md)
EXT=".md"
# Configure note directory (default: ~/Notes/)

# new note in
function nn {
  FILE=$1
  if [ -f "$NOTES_DIR/$FILE" ]
   then
     open -a Macdown "$NOTES_DIR/$FILE"
  fi

  if [ -z "$FILE" ]
   then
    WORD=`perl -e 'open IN, "</usr/share/dict/words";rand($.) < 1 && ($n=$_) while <IN>;print $n'`
    DATE=`date "+%y-%b%d"`
    FILENAME=$DATE$WORD$EXT
    touch "$NOTES_DIR/$FILENAME" && open -a Macdown "$NOTES_DIR/$FILENAME"
  else
    FILENAME=$1'.md'
    touch "$NOTES_DIR/$FILENAME" && open -a Macdown "$NOTES_DIR/$FILENAME"
  fi
}

noteatom() {
  atom "$NOTES_DIR"/"$*".md
}

nsdir() {
  ls -c "$NOTES_DIR" | grep "$*"
}

ns() {
  grep -ri "$*" "$NOTES_DIR"/*
}
