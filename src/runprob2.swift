import files;
import unix;

app (file out) myawk (file awkprog, file stop_words, file infile){
    "/usr/bin/awk" "-f" awkprog stop_words infile @stdout=out
}

file aminer[]=glob("/dev/shm/aminer_mag_papers/*.txt");
file outfiles[];

foreach v, i in aminer{
    outfiles[i] = myawk(input("/home/km0/SMC18/src/prob2.awk"), input("/home/km0/SMC18/data/stop_words.txt"), v);
}

file joined <"joined.txt"> = cat(outfiles);
