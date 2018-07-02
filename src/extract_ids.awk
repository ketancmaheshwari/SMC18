#!/usr/bin/env awk

# This awk program extracts mid and aid from the linking relationships file.

BEGIN{ 
    printf("%-37s %-25s\n", "mid", "aid")
}

{
    gsub("\"",""); gsub(",",""); gsub("}",""); 
    print $2, $4
}

