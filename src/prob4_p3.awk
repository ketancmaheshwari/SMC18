#!/usr/bin/env awk -f

# Problem Statement
#    Identify how topics have shifted over time.
#    
#    The goal of this task is understanding popularity evolution of topics over
#    time, or in other words how the knowledge base is changing over time with the
#    influx of new topics, growth or decay of older topics. Understanding the
#    popularity of topics is important because it helps in identifying trending
#    topics. Same as in case of the previous tasks, the solution should include
#    example output and a description of methods used to produce the output.

# Solution 1 will search for any two topics mentioned and show the number of occurence of both the topics yearwise

# The way to run this code is as follows:
#  awk -v topic1=obesity -v topic2=sugar -f code/prob4.awk aminer_papers_allcols_excl/aminer_papers_*.allcols.excl.txt mag_papers_allcols/mag_papers_*.allcols.txt

# Solution 2 is to find the highest cited paper yearwise and figure out the topics it was based on

# Solution 3 is to find the top 5 trending topics yearwise and see how they appear/disappear in the trend
# We achieve this by writing keywords, titles and abstract to files named after the year they appeared and do postprocessing on those files
BEGIN{
    FS = "qwqw"
    IGNORECASE = 1
    # Field names
    id=1; title=2; num_authors=3; doi=4; fos_isbn=5; doctype_issn=6;
    lang=7; n_citation=8; issue=9; url=10; volume=11; page_start=12;
    page_end=13; year=14; venue=15; publisher_pdf=16; references=17;
    keywords=18; abstract=19; authors=20;
}

NR==FNR{x[$1];next}

#$lang~/en/ && $n_citation!~/null/ && $year!~/null/ && $year>1800 && $year<2018 && $keywords!~/null/{
$lang~/en/ && $n_citation>0 && $year==yr && $keywords!~/null/{
    # write title, keywords and abstract to a file titled by the year in which they appear
    # treat title
    $title = tolower($title)
    split($title, a, " ")
    for (i in a) if(length(a[i])>2 && match(a[i],/[a-z]/) && a[i] in x == 0) print a[i]

    # treat keywords
    $keywords = tolower($keywords)
    gsub("\"","",$keywords)
    split($keywords, b, ",")
    for (i in b) if(length(b[i])>2 && match(b[i],/[a-z]/) && b[i] in x == 0) print b[i]

     # treat abstract (Computationally expensive--ran once, results are in: top_1000_words_from_kw_abstract_title_by_freq.txt)
     $abstract = tolower($abstract)
     gsub("\"","",$abstract)
     gsub(",","",$abstract)
     split($abstract, c, " ")
     for (i in c) if(length(c[i])>2 && match(c[i],/[a-z]/) && c[i] in x == 0) print c[i]

    #print $title,$keywords,$abstract >> $year
}

#END{
#}

#Do the following for postprocessing:
#for i in 18?? 19?? 20??; do (grep -o -E '\w+' $i | tr [A-Z] [a-z]|sed -e 's/null//g' -e 's/^.$//g' -e 's/^..$//g' -e 's/^[0-9]*$//g' | awk NF | fgrep -v -w -f stop_words.txt |sort | uniq -c | sort -nr | head -10 > trending/trending.$i.txt) & done
