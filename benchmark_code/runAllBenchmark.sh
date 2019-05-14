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

shopt -s nullglob
VARS=(../datasets/*.ungraph*)
OUTDIR="out/"

for var in ${VARS[@]}; do
    echo "Processing $var"
    BASENAME="${var##*/}"
    if [ $BASENAME == "com-amazon.ungraph.txt" ]; then
        DEGREE=4
    else
        DEGREE=2
    fi
    ./build/scoda -f "$var" -o "$OUTDIR${var##*/}.scodaComms.txt" -d $DEGREE >| "$OUTDIR${var##*/}.timereport.txt"
done
