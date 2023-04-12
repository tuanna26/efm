#!/bin/bash

TARGET="$1"
FILE="$2"
RECIPIENT="$3"


# Get the absolute path of the script's directory
SCRIPT_DIR=$(dirname $(realpath $0))

MAKEFILE_PATH="$SCRIPT_DIR/Makefile"


if [ -z "$TARGET" ] || [ -z "$FILE" ] && [[ $TARGET != 'list_secret' ]]; then
    echo "Usage: ./encrypt_decrypt.sh <target> <file> [recipient]"
    exit 1
fi

if [[ $TARGET == 'protect' ]]; then
  # Move to the script's directory
  cp $FILE $SCRIPT_DIR
  cd $SCRIPT_DIR
fi

if [[ $TARGET = 'show_secret' ]] || [[ $TARGET = 'list_secret' ]]|| [[ $TARGET = 'remove_secret' ]]; then
  cd $SCRIPT_DIR
fi


if [ -z "$RECIPIENT" ]; then
    make -f "$MAKEFILE_PATH" $TARGET FILE="$FILE"
else
    make -f "$MAKEFILE_PATH" $TARGET FILE="$FILE" RECIPIENT="$RECIPIENT"
fi
