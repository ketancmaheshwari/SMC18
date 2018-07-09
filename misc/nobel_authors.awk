#!/usr/bin/env awk

# This awk program finds the maximum citations a paper has and prints the id, name and authors details of the paper.

BEGIN{ 
    IGNORECASE=1
    FS="qwqw"
    OFS="==>"
}

NR==FNR{
    keys[NR]=$3;totrec=NR; next
}

FILENAME!~/nobel/{
    for (i=1;i<=totrec;i++){
        if (keys[i] == $20){
            print keys[i],$20
        }
    }
}

