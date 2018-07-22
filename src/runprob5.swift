import files;
import unix;

app (file out) myawk (file awkprog, file infile, string topic1, string topic2, string topic3, string topic4){
    "/usr/bin/awk" "-v" topic1 "-v" topic2 "-v" topic3 "-v" topic4 "-f" awkprog infile @stdout=out
}

file aminer[]=glob("/dev/shm/aminer_mag_papers/*.txt");
file outfiles[];

foreach v, i in aminer{
    outfiles[i] = myawk(input("/home/km0/SMC18/src/prob5.awk"), v, "topic1=battery", "topic2=electronics", "topic3=lithium", "topic4=energy");
}

file joined <"joined.txt"> = cat(outfiles);
