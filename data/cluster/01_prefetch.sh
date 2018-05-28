#! /bin/bash

# fetch the data to local cache
# iterate through runinfo table from SRA

module load ngs/sratoolkit/2.8.0

i=1
while read line
do
	test $i -eq 1 && ((i=i+1)) && continue
	set $line
	prefetch ${13}
done < SraRunTable.txt
