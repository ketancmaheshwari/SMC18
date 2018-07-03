#!/usr/bin/env awk

# Problem Statement
#   Identify the individual or group of individuals who appear to be the expert in
#   a particular field or sub-field.
#   
#   Experts are people with high level of knowledge in a certain area. The
#   goal of this task is to employ different methods, for example modelling or
#   graph-based algorithms, and apply them on the dataset to discover people
#   with high level of expertise. The response to this task should include
#   example output, such as the model or graph developed with highlighted
#   important nodes or a list of names, and a description of tools and methods
#   used to produce the output. 

# Solution:
# step1. Filter the input to relevant columns: id, title, fos, lang (must be en), n_citation, keywords, abstract, authors
# step2. Eliminate unnecessary content such as punctuation, non-printable chars and small words such as 1 letter and 2 letter words
# step3. Find the papers with high number of citations; authors of these papers would be considered experts.
# step4. Find the authors who have won nobel prizes--they would certainly be considered experts.

BEGIN{
    FS="qwqw"
    OFS="\t"
    IGNORECASE=1
    # Field names
    id=1; title=2; num_authors=3; doi=4; fos_isbn=5; doctype_issn=6;
    lang=7; n_citation=8; issue=9; url=10; volume=11; page_start=12;
    page_end=13; year=14; venue=15; publisher_pdf=16; references=17;
    keywords=18; abstract=19; authors=20;
}

#($0~topic && $num_authors > 0 && $n_citation!~/null/ && $n_citation>100 && $lang~/en/){
($0~topic && $num_authors > 0 && $n_citation!~/null/ && $n_citation>100){
    #find out the authors whose names are repeating for a particular topic. Those authors will be considered experts. 
    gsub("\"","",$authors)
    split($authors, a, ";")
    for (i in a){
        split(a[i], b, ",")
        if(b[1]!~/null/) auths[b[1]]++
    }
}

END{
   for (k in auths) if(auths[k]>1) print auths[k], k
}
# Seems like there are some duplicates in the results.
# Probably should also find best patents separately.
# https://blog.jpalardy.com/posts/my-best-awk-tricks
