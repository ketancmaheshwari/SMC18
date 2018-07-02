#!/usr/bin/env awk

NR==FNR{
    a[$1]=$2
}

!($1 in a) && NR!=FNR && FILENAME=="l1.txt"{ print $0, FNR, FILENAME }
FILENAME=="l2.txt"{print "Hello"}
