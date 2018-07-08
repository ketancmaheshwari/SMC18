#!/bin/bash


#qwqw is the column seperator
for i in $(seq 0 166)
do 
  ./jq  '. | "\(.id)qwqw\(.title)qwqw\(.authors|length)qwqw\(.doi)qwqw\(.fos)qwqw\(.doc_type)qwqw\(.lang)qwqw\(.n_citation)qwqw\(.issue)qwqw\(.url)qwqw\(.volume)qwqw\(.page_start)qwqw\(.page_end)qwqw\(.year)qwqw\(.venue)qwqw\(.publisher)qwqw\(.references)qwqw\(.keywords)qwqw\(.abstract)"' mag/mag_papers_$i.txt > mag_papers_$i.col.txt

done

for i in $(seq 0 166)
do
    ./jq  '. | "\(.id)qwqw\(.title)qwqw\(.authors|length)qwqw\(.doi)qwqw\(.isbn)qwqw\(.issn)qwqw\(.lang)qwqw\(.n_citation)qwqw\(.issue)qwqw\(.url)qwqw\(.volume)qwqw\(.page_start)qwqw\(.page_end)qwqw\(.year)qwqw\(.venue)qwqw\(.pdf)qwqw\(.references)qwqw\(.keywords)qwqw\(.abstract)"' aminer/aminer_papers_$i.txt > aminer/aminer_papers_$i.col.txt

done

