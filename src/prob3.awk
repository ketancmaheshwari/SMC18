#!/usr/bin/env awk


# problem statement
#    visualize the geographic distribution of the topics in the publications.
#    
#    Researchers are associated with different institutions across the globe.
#    Following up on the previous task, the goal of this task is to visualize the
#    identified topics with respect to their geographical distribution. Are there
#    certain locations which focus on specific topics? The solution should again
#    contain a description of how was the output produced.

# HOW TO RUN:
# awk -v topic=birds -f prob3.awk cities.txt ../mag_papers_allcols/mag_papers_*.allcols.txt ../aminer_papers_allcols_excl/aminer_papers_*.allcols.excl.txt
# awk -v topic=crows -f prob3.awk countries.txt ../mag_papers_allcols/mag_papers_*.allcols.txt ../aminer_papers_allcols_excl/aminer_papers_*.allcols.excl.txt
# awk -v topic=crows -f prob3.awk universities.txt ../mag_papers_allcols/mag_papers_*.allcols.txt ../aminer_papers_allcols_excl/aminer_papers_*.allcols.excl.txt


BEGIN{
    FS="qwqw"
    IGNORECASE = 1
    # Field names
    id=1; title=2; num_authors=3; doi=4; fos_isbn=5; doctype_issn=6;
    lang=7; n_citation=8; issue=9; url=10; volume=11; page_start=12;
    page_end=13; year=14; venue=15; publisher_pdf=16; references=17;
    keywords=18; abstract=19; authors=20;

}

NR==FNR{a[$1];next} #process the countries/cities file

#treat records with more than one author
#$0~topic && $num_authors!~/null/ && $lang~/en/ && $authors~/\,/{ 
$0~topic && $num_authors!~/null/ && $authors~/\,/{ 
    #extract words from author's affiliation and compare with the countries. If a match is found increment that array entry.
    w=split($authors, b, ",")
    for (i=0;i<w;i++){
        gsub(";"," ",b[i]) 
        if (b[i] in a) a[b[i]]++
    }
}

END{
 for(k in a){ 
   if(a[k]) print a[k], k
 }
}

# Run the following pipeline on the results:
# sort -nr -k 1 citywise_papers.txt > tmp && mv tmp citywise_papers.txt 
