if [ ! -d 'datasets' ]; then
  mkdir datasets
fi

# Then run the curl command in a loop with gunzip.  
# May try to do this with xargs to use parallel processes
