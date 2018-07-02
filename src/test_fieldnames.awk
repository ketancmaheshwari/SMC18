#!/usr/bin/env awk

# Mag/Aminer papers fields        

#  $1 id
#  $2 title
#  $3 num_authors
#  $4 doi
#  $5 fos/isbn
#  $6 doc_type/issn
#  $7 lang
#  $8 n_citation
#  $9 issue
#  $10 url
#  $11 volume
#  $12 page_start
#  $13 page_end
#  $14 year
#  $15 venue
#  $16 publisher/pdf
#  $17 references
#  $18 keywords
#  $19 abstract
#  $20 authors


BEGIN{
    FS="qwqw"
    #OFS="\t"
    IGNORECASE=1
    # Field names
    id=1; title=2; num_authors=3; doi=4; fos_isbn=5; doctype_issn=6;
    lang=7; n_citation=8; issue=9; url=10; volume=11; page_start=12;
    page_end=13; year=14; venue=15; publisher_pdf=16; references=17;
    keywords=18; abstract=19; authors=20;
}

($num_authors!~/null/ && $n_citation!~/null/ && $title~/[cC]rows/){
    print $title, $id
}

# Seems like there are some duplicates in the results.
# Probably should also find best patents separately.
# https://blog.jpalardy.com/posts/my-best-awk-tricks
