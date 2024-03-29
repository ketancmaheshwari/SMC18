#!/usr/bin/env awk -f

# Problem Statement
#    Given a research proposal, determine whether the proposed work has been
#    accomplished previously.
#    
#    Choosing which proposals to fund is a complicated task, because the evaluators
#    needs to be aware of the research area and whether the proposed research is
#    novel. The goal of this task is to identify whether there are any publications
#    which have previously tackled the proposed research.

# Solution: Find the keywords on a new proposal. If those keywords appear in an existing publication record, it is a suspect.

BEGIN{
    FS = "qwqw"
    IGNORECASE = 1 

    # Field names
    id=1; title=2; num_authors=3; doi=4; fos_isbn=5; doctype_issn=6;
    lang=7; n_citation=8; issue=9; url=10; volume=11; page_start=12;
    page_end=13; year=14; venue=15; publisher_pdf=16; references=17;
    keywords=18; abstract=19; authors=20;
}


# topic1 .. topic4 are provided at command line

$0~topic1 && $0~topic2 && $0~topic3 && $0~topic4 && $lang~/en/ && $authors!~/null/{
    print $id, $title, $authors, $year
}

