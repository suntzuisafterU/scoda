#!/bin/bash

DATADIR="../datasets"
OUTDIR="out"

if [ !-d $OUTDIR ]; then
  mkdir $OUTDIR
fi

DATASETS=(
"com-amazon.all.dedup.cmty.txt"
"com-dblp.all.cmty.txt"
"com-friendster.all.cmty.txt"
"com-lj.all.cmty.txt"
"com-orkut.all.cmty.txt"
"com-youtube.all.cmty.txt"
)

for d in "${DATASETS[@]}"
do
  if [ -e "$DATADIR/$d" ]; then
    awk 'BEGIN{max=100;
    for(j=0; j<max; j++){
      sum[j]=0; # initialize array of zeroes
    }
  } 
  {
    for(i=0; i<max; i++){
      if($i!="") sum[i]+=1 # this community has at least i members
      }
    }
    END{
    for(k=0; k<max; k++){
      print (k+1), sum[k] # print results
    }
  }' "$DATADIR/$d" >| "$OUTDIR/$d.commSums.txt"
else
  echo "$d does not exist"
fi
done

SCODA_DATASETS=(
"com-amazon.SCoDA_comm.txt"
"com-dblp.SCoDA_comm.txt"
"com-friendster.SCoDA_comm.txt"
"com-lj.SCoDA_comm.txt"
"com-orkut.SCoDA_comm.txt"
"com-youtube.SCoDA_comm.txt"
)

for d in "${SCODA_DATASETS[@]}"
do
  if [ -e "$OUTDIR/$d" ]; then
    awk 'BEGIN{max=100;
    for(j=0; j<max; j++){
      sum[j]=0; # initialize array of zeroes
    }
  } 
  {
    for(i=0; i<max; i++){
      if($i!="") sum[i]+=1 # this community has at least i members
      }
    }
    END{
    for(k=0; k<max; k++){
      print (k+1), sum[k] # print results
    }
  }' "$DATADIR/$d" >| "$OUTDIR/$d.SCoDA_commSums.txt"
else
  echo "$d does not exist"
fi
done
