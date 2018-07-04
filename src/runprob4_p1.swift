import files;
import unix;

app (file out) myawk (file awkprog, file c_c_univs, file infile, string topic1, string topic2){
    "/usr/bin/awk" "-v" "topic1="topic1 "topic2="topic2 "-f" awkprog c_c_univs infile @stdout=out
}

file aminer[]=glob("/dev/shm/aminer_mag_papers/*.txt");
file outfiles[];
file outfiles_countries[];
file outfiles_univs[];

foreach v, i in aminer{
    outfiles[i] = myawk(input("/home/km0/SMC18/src/prob4_p1.awk"), input("/home/km0/SMC18/data/cities.txt"), v, "evolution", "human");
}

file joined <"joined.txt"> = cat(outfiles);

// After running the swift app:
// awk -F: '{a[$2]+=$1} END{for (k in a) print a[k],k}' joined.txt | sort -nr > freq.txt
