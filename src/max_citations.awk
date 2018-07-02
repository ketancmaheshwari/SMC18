#!/usr/bin/env awk

# This awk program finds the maximum citations a paper has and prints the id, name and authors details of the paper.

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


BEGIN{ 
    FS=OFS="qwqw"
}
$8!~/null/ && $8>30000{
print $8,$1,$2,$20,$18,$14,$15
}

