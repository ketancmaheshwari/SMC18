#!/usr/bin/env awk

# linking relations

# $1 magid
# $2 aminerid

#    
#  Filter duplicate papers and remove them from aminer database based on the linking relationship 
#    


BEGIN{FS=OFS="qwqw"}

NR==FNR{a[$2]=$1}

!($1 in a) && FILENAME ~ /aminer/{ print }
