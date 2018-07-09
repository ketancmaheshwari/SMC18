import files;

app (file out) mygrep (file inputs[], string searchterm){
    "/usr/bin/grep" searchterm inputs @stdout=out
}

file joined <"joined.txt"> = mygrep(glob("/dev/shm/aminer_papers_allcols_excl/*.txt"), "Maheshwari");
