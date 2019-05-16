#!/bin/bash

SCRIPT_NAME="$0"
USAGE="Usage: \n $SCRIPT_NAME -f <in file path> -o <out file path> [positional args (if any)]"

case $op in
    -f )
        INPATH="$1"
        shift # past -f
        shift # past value
        ;;
    -o )
        OUTPATH="$1"
        shift
        shift
        ;;
esac

# Validate command line args
if [ "$INPATH" = "" ] || [ "$OUTPATH" = "" ]; then
    echo -e "$USAGE"
    exit 1
fi

# source for next 2 lines: https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
BASENAME=$(basename -- "$INPATH") # Extract base file name here.
EXT="${BASENAME##*.}"# Extract extension. 