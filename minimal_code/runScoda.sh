#!/bin/bash

SCRIPT_NAME="$0"
USAGE="Usage: \n $SCRIPT_NAME -f <in file path> -o <out file path> -d <degree threshold> -n <max node id> -m <number of edges> -i <number of lines to ignore>"

while [[ $# -gt 0 ]]
  do op="$1"
    case $op in
        -f )
            INPATH="$2"
            shift # past -f
            shift # past value
            ;;
        -o )
            OUTPATH="$2"
            shift
            shift
            ;;
        -d )
            DEGREE="$2"
            shift
            shift
            ;;
        -n )
            NUM_NODES="$2"
            shift
            shift
            ;;
        -m )
            NUM_EDGES="$2"
            shift
            shift
            ;;
        -i )
            IGNORE_LINES="$2"
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
EXT="${BASENAME##*.}" # Extract extension.

scoda $NUM_NODES $NUM_EDGES $DEGREE $IGNORE_LINES < "$INPATH" >| "$OUTPATH"
# n=548458, m=925876 for amazon dataset, ignore 4 lines, degree threshold 4
