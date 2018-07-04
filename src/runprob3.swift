import files;
import unix;

app (file out) myawk (file awkprog, file c_c_univs, file infile, string topic){
    "/usr/bin/awk" "-v" "topic="topic "-f" awkprog c_c_univs infile @stdout=out
}

file aminer[]=glob("/dev/shm/aminer_mag_papers/*.txt");
file outfiles_cities[];
file outfiles_countries[];
file outfiles_univs[];

foreach v, i in aminer{
    outfiles_cities[i] = myawk(input("/home/km0/SMC18/src/prob3.awk"), input("/home/km0/SMC18/data/cities.txt"), v, "meditation");
//  outfiles_countries[i] = myawk(input("/home/km0/SMC18/src/prob3.awk"), input("/home/km0/SMC18/data/countries.txt"), v, "meditation");
//  outfiles_univs[i] = myawk(input("/home/km0/SMC18/src/prob3.awk"), input("/home/km0/SMC18/data/universities.txt"), v, "meditation");
}

file joined_cities <"joined_cities.txt"> = cat(outfiles_cities);
//file joined_countries <"joined_countries.txt"> = cat(outfiles_countries);
//file joined_univs <"joined_univs.txt"> = cat(outfiles_univs);

// After running the swift app:
// awk -F: '{a[$2]+=$1} END{for (k in a) print a[k],k}' joined.txt | sort -nr > freq.txt
