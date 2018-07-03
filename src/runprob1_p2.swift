import files;
import unix;

app (file out) myawk (file awkprog, file infile, string topic){
    "/usr/bin/awk" "-v" "topic="topic "-f" awkprog infile @stdout=out
}

file aminer[]=glob("/dev/shm/aminer_mag_papers/*.txt");
file outfiles[];

foreach v, i in aminer{
    outfiles[i] = myawk(input("/home/km0/SMC18/src/prob1_p2.awk"), v, "cancer");
}

file joined <"joined.txt"> = cat(outfiles);
