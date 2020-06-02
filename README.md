# SMC18

I wrote a [blog post](https://ketancmaheshwari.github.io/posts/2020/05/24/SMC18-Data-Challenge-4.html) about this work.
I participated in a organizational data challenge in 2018 and chose awk to process the massive data to solve several interesting challenges. A report detailing the approach and results is [here](https://github.com/ketancmaheshwari/SMC18/blob/master/report/SMC18_DataChallenge4.pdf).
 This repo contains the artefacts about the [Smoky Mountains Data Challenge](https://smc-datachallenge.ornl.gov) 2018 that I solved (and won first prize). In the following, I describe the approach, method and some interesting tidbits.

## A pdf report may be found in the /report folder.

SMC Data Challenge 4 Scientific Publications Mining

. Run awk code:

`awk -f prob2.awk stop_words.txt data_dir/*.txt`

. Compile Swift code:

`stc runprob2.swift #will generate tic file`

. Run Swift code:

`turbine -n 340 runprob2.tic`
