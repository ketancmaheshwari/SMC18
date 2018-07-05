import files;
import unix;

app (file out) myawk (file awkprog, file infile){
    "/usr/bin/awk" "-f" awkprog infile @stdout=out
}

file aminer[]=glob("/dev/shm/aminer_mag_papers/*.txt");
file outfiles[];

foreach v, i in aminer{
    outfiles[i] = myawk(input("/home/km0/SMC18/src/prob4_p2.awk"), v);
}

file joined <"joined.txt"> = cat(outfiles);

// After running the swift app (This is not correct, need to find max $1 for given year)
// awk -F: '{if($1>max[$2]) max[$2]=$1} END{for (k in max) print max[k],k}' joined.txt | sort -nr > freq.txt
