#!/bin/bash

SCRIPT_NAME="$0"
USAGE="Usage: \n $SCRIPT_NAME -f <in file path> -o <out file path> -d <degree threshold> -n <max node id> -m <number of edges> -i <number of lines to ignore>"

while [[ $# -gt 0 ]]
  do op="$1"
    case $op in
        -f)
            INPATH="$1"
            shift # past -f
            shift # past value
            ;;
        -o)
            OUTPATH="$1"
            shift
            shift
            ;;
        -d )
            DEGREE="$1"
            shift
            shift
            ;;
        -n )
            NUM_NODES="$1"
            shift
            shift
            ;;
        -m )
            NUM_EDGES="$1"
            shift
            shift
            ;;
        -i )
            IGNORE_LINES="$1"
            shift
            shift
            ;;
    esac
done

# Validate command line args
if [ "$INPATH" = "" ] || [ "$OUTPATH" = "" ]; then
    # TEmp testing
    echo "in $INPATH, out: $OUTPATH"
    echo -e "$USAGE"
    exit 1
fi

# source for next 2 lines: https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
BASENAME=$(basename -- "$INPATH") # Extract base file name here.
EXT="${BASENAME##*.}"# Extract extension.

./scoda $NUM_NODES $NUM_EDGES $DEGREE $IGNORE_LINES < "$INPATH" > "$OUTPATH"
