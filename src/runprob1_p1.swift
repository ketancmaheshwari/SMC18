import files;
import unix;
import string;

app (file out) myawk (file awkprog, file infile, string topic){
    "/usr/bin/awk" "-v" topic "-f" awkprog infile @stdout=out
}

file aminer[]=glob("/dev/shm/aminer_mag_papers/*.txt");
file outfiles[];

foreach v, i in aminer{
    outfiles[i] = myawk(input("/home/km0/SMC18/src/prob1_p1.awk"), v, sprintf("topic=%s","meditation"));
}

file joined <"joined.txt"> = cat(outfiles);
