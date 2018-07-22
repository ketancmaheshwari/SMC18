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

# Given a list of topics, generate appearance vector; ie. for each topic, 1 if it appears in a record and 0 if not

BEGIN{
    FS = "qwqw"
    IGNORECASE = 1
    # Field names
    id=1;             title=2;       num_authors=3; doi=4;       fos_isbn=5; 
    doctype_issn=6;   lang=7;        n_citation=8;  issue=9;     url=10;
    volume=11;        page_start=12; page_end=13;   year=14;     venue=15; 
    publisher_pdf=16; references=17; keywords=18;   abstract=19; authors=20;
    flag=0;
}

NR==FNR{topic[$1];next}

$lang~/en/ && ($keywords!~/null/ || $title!~/null/ || $abstract!~/null/) {
    # treat title
    $title = tolower($title)
    lena=split($title, a, " ")

    # treat keywords
    $keywords = tolower($keywords)
    lenb=split($keywords, b, ",")

     # treat abstract (Computationally expensive--ran once, results are in: top_1000_words_from_kw_abstract_title_by_freq.txt)
     $abstract = tolower($abstract)
     gsub("\"","",$abstract)
     gsub(",","",$abstract)
     lenc=split($abstract, c, " ")
     
     for (i in topic){
         for (n=0;n<alen;n++) 
             if(a[n]==i){ topic[i]=topic[i]",1" }else{ topic[i]=topic[i]",0" }

         for (n=0;n<blen;n++) 
             if(b[n]==i){ topic[i]=topic[i]",1" }else{ topic[i]=topic[i]",0" }

         for (n=0;n<clen;n++) 
             if(c[n]==i){ topic[i]=topic[i]",1" }else{ topic[i]=topic[i]",0" }
    }
}

END{
    for(i in topic){
        print topic[i]"\n\n"
    }
}

