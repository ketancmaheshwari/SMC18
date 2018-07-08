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

# Solution 2 is to find the highest cited paper yearwise and figure out the topics it was based on
BEGIN{
    FS = OFS = "qwqw"
    IGNORECASE = 1
    # Field names
    id=1; title=2; num_authors=3; doi=4; fos_isbn=5; doctype_issn=6;
    lang=7; n_citation=8; issue=9; url=10; volume=11; page_start=12;
    page_end=13; year=14; venue=15; publisher_pdf=16; references=17;
    keywords=18; abstract=19; authors=20;
}

$lang~/en/ && $year!~/null/ && $year < 2020 && $keywords!~/null/ && $n_citation!~/null/ && $n_citation>max[$year]{
    max[$year]=$n_citation; a[$year]=$keywords
}

END{
n=asorti(a,b)
for (i=1;i<=n;i++) print b[i], a[b[i]], max[b[i]]
}
# Run via Swift in parallel. If serial, run like so:
#awk -f code/prob4_p2.awk aminer_mag_papers/*.txt > yearwise_trending_keywords.txt

# Solution 3 is to find the top 5 trending topics yearwise and see how they appear/disappear in the trend
