# Running Awk in Parallel to process 256M Records

I wrote a [blog post](https://ketancmaheshwari.github.io/posts/2020/05/24/SMC18-Data-Challenge-4.html) about this work.

This repo contains the artefacts about the [Smoky Mountains Data Challenge](https://smc-datachallenge.ornl.gov) 2018 that I solved (and won first prize). In the following, I describe the approach, method and some interesting tidbits.

## A pdf report may be found in the /report folder.

SMC Data Challenge 4 Scientific Publications Mining

. To run the awk code:

`awk -f prob2.awk stop_words.txt data_dir/*.txt`

. To compile the Swift code:

`stc runprob2.swift #will generate tic file`

. To run Swift code:

`turbine -n 340 runprob2.tic`
