# SMC18
This repo contains the artefacts about the [Smokey Mountains Data Challenge](https://smc-datachallenge.ornl.gov) 2018 that I solved (and won first prize). In the following, I describe the approach, method and some interesting tidbits.

## A pdf report may be found in the /report folder.

SMC Data Challenge 4 Scientific Publications Mining

. Run awk code:

`awk -f prob2.awk stop_words.txt data_dir/*.txt`

. Compile Swift code:

`stc runprob2.swift #will generate tic file`

. Run Swift code:

`turbine -n 340 runprob2.tic`
