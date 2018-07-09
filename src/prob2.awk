#!/usr/bin/env awk -f

# Problem  Statement
#    Identify topics that have been researched across all publications.  
#    
#    Given a collection of documents, the goal of this task is to extract topics
#    that recur in the collection so that a person not familiar with the collection
#    can quickly explore its contents. The aim is to assist human understanding, so
#    a good solution should identify topics in a way that makes sense to a person.
#    This task could explore for example graph or text clustering methods. The
#    solution should also include a description of methods used for the task.  

# Solution:
# step1. Filter the input to English language records 
# step2. Eliminate unnecessary content such as punctuation, non-printable chars and small words such as 1 letter and 2 letter words
# step3. Extract words used in keywords, title and abstract
# step4. Find most frequently used words 

BEGIN{
    FS = "qwqw"
    IGNORECASE = 1
    # Field names
    id=1;             title=2;       num_authors=3; doi=4;       fos_isbn=5; 
    doctype_issn=6;   lang=7;        n_citation=8;  issue=9;     url=10;
    volume=11;        page_start=12; page_end=13;   year=14;     venue=15; 
    publisher_pdf=16; references=17; keywords=18;   abstract=19; authors=20;
}

NR==FNR{x[$1];next}

$lang~/en/ && ($keywords!~/null/ || $title!~/null/ || $abstract!~/null/) {
    # treat title
    $title = tolower($title)
    split($title, a, " ")
    for (i in a) if(length(a[i])>2 && match(a[i],/[a-z]/) && a[i] in x == 0) kw[a[i]]++

    # treat keywords
    $keywords = tolower($keywords)
    split($keywords, b, ",")
    for (i in b) if(length(b[i])>2 && match(b[i],/[a-z]/) && b[i] in x == 0) kw[b[i]]++

     # treat abstract (Computationally expensive--ran once, results are in: top_1000_words_from_kw_abstract_title_by_freq.txt)
     $abstract = tolower($abstract)
     gsub("\"","",$abstract)
     gsub(",","",$abstract)
     split($abstract, c, " ")
     for (i in c) if(length(c[i])>2 && match(c[i],/[a-z]/) && c[i] in x == 0) kw[c[i]]++
}

END{
    for(k in kw){
        if (kw[k]>1000) print kw[k], k
    }
}

# HOW TO RUN: LC_ALL=C awk -f prob2.awk stop_words.txt ../aminer_papers_allcols_excl/aminer_papers_*.allcols.excl.txt ../mag_papers_allcols/mag_papers_*.allcols.txt | sort -nr >freq.txt

# After running the swift app:
# awk '{a[$2]+=$1} END{for (k in a) print a[k],k}' joined.txt | sort -nr > freq.txt
