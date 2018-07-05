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

// After running the swift code:
// awk -Fqwqw '{if($3>max[$1]){max[$1]=$3; a[$1]=$2}} END{for (k in max) print max[k],k,a[k]}' joined.txt | sort -nr -k2 > freq.txt 
