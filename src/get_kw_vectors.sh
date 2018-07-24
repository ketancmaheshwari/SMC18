#!/bin/bash

for i in $(cut -d' ' -f2 top_10_keywords_by_freq.txt)
do 
    awk -Fqwqw -v kw="$i" 'BEGIN{IGNORECASE=1} $0~/kw/{printf("1,");next} $0!~/kw/{printf("0,")}' aminer_mag_papers/mag_papers_99.allcols.txt >> $i.csv

done
