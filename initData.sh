if [ ! -d 'datasets' ]; then
  mkdir datasets
fi

curl -o datasets/com-amazon.ungraph.txt.gz https://snap.stanford.edu/data/bigdata/communities/com-amazon.ungraph.txt.gz
gunzip datasets/com-amazon.ungraph.txt.gz
# Then run the curl command in a loop with gunzip.  
# May try to do this with xargs to use parallel processes
