import files;
import io;
import unix;
import string;

app (file out) myawk (file awkprog, file infile, file stopwords, string yr){
    "/usr/bin/awk" "-v" yr "-f" awkprog stopwords infile @stdout=out
}

file aminer[]=glob("/dev/shm/aminer_mag_papers/aminer*.txt");

foreach y in [2011:2015:1]{
    file yearfiles[];
    printf("%i\n",y);
    foreach v, i in aminer{
        yearfiles[i] = myawk(input("/home/km0/SMC18/src/prob4_p3.awk"), v, input("/home/km0/SMC18/data/stop_words.txt"), sprintf("yr=%s",toString(y)));
    }
    file joined <sprintf("year%s.txt",toString(y))> = cat(yearfiles);
}

