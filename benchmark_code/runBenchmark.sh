# Graph filename not set
# Usage: scoda <flags>
# Availaible flags:
# 	-f [graph file name] : Specifies the graph file.
# 	-o [output file name] : Specifies the output file for communities.
# 	-d [maximum degree] : Specifies the maximum degree for the aggregation phase.
# 	--filter-singletons [0/1] : Specifies if single-node communities must be filtered (default: 0).
# 	--leaf-aggregation [0/1] : Specifies if a pass of leaf aggregation must be applied (default: 0).
#   NOTE: 0 means off.

# run all datasets
DATADIR="../datasets/"
OUTDIR="out/"
VAR=$1 #commandline file name
DEGREE=$2

if [ -z $VAR ]; then
    echo "Enter the name of a file in ../datasets"
    exit -1
elif [ -z $DEGREE ]; then
    echo "Second argument specifies degree parameter."
    exit -1
fi

echo "$VAR"

./build/scoda -f "$DATADIR$VAR" -o "$OUTDIR$VAR".scodaComms.txt -d "$DEGREE" 0 0


