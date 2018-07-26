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

# Solution 1 below will search for any two topics mentioned and show the number of occurence of both the topics yearwise

BEGIN{
    # Field Separator
    FS = "qwqw"
    IGNORECASE = 1
    # Field names
    id=1; title=2; num_authors=3; doi=4; fos_isbn=5; doctype_issn=6;
    lang=7; n_citation=8; issue=9; url=10; volume=11; page_start=12;
    page_end=13; year=14; venue=15; publisher_pdf=16; references=17;
    keywords=18; abstract=19; authors=20;
}

$lang~/en/ && $year!~/null/ && $0~topic1 && $0~topic2 {
    a[$year]++
}

END{
    n=asorti(a,b)
    printf("Trend for topics: %s, %s\n", topic1, topic2)
    for (i=1;i<=n;i++) printf("%d :- %d\n", b[i], a[b[i]])
}

# Run this code is as follows:
# awk -v topic1=obesity -v topic2=sugar -f code/prob4.awk aminer_mag_papers/*.txt

# Solution 2 is to find the highest cited paper yearwise and figure out the topics it was based on

# Solution 3 is to find the top 5 trending topics yearwise and see how they appear/disappear in the trend
