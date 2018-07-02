#!/usr/bin/env awk

'$20~/[sS]uhas.*[sS]omnath/{print $1,$2,$20}' 
