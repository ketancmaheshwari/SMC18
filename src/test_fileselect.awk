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

# Problem Statement
#    Identify the individual or group of individuals who appear to be the expert in
#    a particular field or sub-field.
#    
#    Experts are people with high level of knowledge in a certain area. Recognizing
#    experts can be beneficial to students familiarizing themselves with a new area
#    or to scientists looking for collaborators. The goal of this task is to employ
#    different methods, for example modelling or graph-based algorithms, and apply
#    them on the dataset to discover people with high level of expertise. The
#    response to this task should include example output, such as the model or graph
#    developed with highlighted important nodes or a list of names, and a
#    description of tools and methods used to produce the output. 


BEGIN{FS="qwqw"}

NR==FNR{a[$1]=$2}

FILENAME~/mag/ && FNR==29300{print $1, FILENAME}

FILENAME~/aminer/ && FNR==97600{print $1, FILENAME}
