#!/usr/bin/env awk -f

BEGIN{
    FS = "qwqw"
    IGNORECASE = 1 
    # Field names
    id=1; title=2; num_authors=3; doi=4; fos_isbn=5; doctype_issn=6;
    lang=7; n_citation=8; issue=9; url=10; volume=11; page_start=12;
    page_end=13; year=14; venue=15; publisher_pdf=16; references=17;
    keywords=18; abstract=19; authors=20;
}

$authors~auth && $n_citation>=100 && $authors!~/null/{
    i100++
}

END{ 
printf("The i100 number for author %s is %d\n", auth, i100)
}
