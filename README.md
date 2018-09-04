# SMC18
## A pdf report may be found in the /report folder.

SMC Data Challenge 4 Scientific Publications Mining

https://smc-datachallenge.ornl.gov


. Run awk code:

`awk -f prob2.awk stop_words.txt data_dir/*.txt`

. Compile Swift code:

`stc runprob2.swift #will generate tic file`

. Run Swift code:

`turbine -n 340 runprob2.tic`
