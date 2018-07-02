#!/usr/bin/env awk

# Mag papers keys

#   $1 id
#   $2 title
#   $3 num_authors
#   $4 doi
#   $5 fos
#   $6 doc_type
#   $7 lang
#   $8 n_citation
#   $9 issue
#   $10 url
#   $11 volume
#   $12 page_start
#   $13 page_end
#   $14 year
#   $15 venue
#   $16 publisher
#   $17 references
#   $18 keywords
#   $19 abstract
#   $20 authors

# Aminer papers keys

#    $1 id
#    $2 title
#    $3 num_authors
#    $4 doi
#    $5 isbn
#    $6 issn
#    $7 lang
#    $8 n_citation
#    $9 issue
#    $10 url
#    $11 volume
#    $12 page_start
#    $13 page_end
#    $14 year
#    $15 venue
#    $16 pdf
#    $17 references
#    $18 keywords
#    $19 abstract
#    $20 authors


# Program to find h-index and i100 for the authors with best citation records.
# h-index is the largest number h such that h publications have at least h citations.

BEGIN{FS="qwqw"}

NR==FNR{a[$1]=$2}
