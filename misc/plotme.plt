set terminal png size 800,500 enhanced
set output "../results/trending_words_by_year/trending.2009.txt.png"
set   autoscale                        # scale axes automatically
set style fill solid 1.0 border rgb 'grey10'
set boxwidth 0.5
unset log                              # remove any log-scaling
#unset label                            # remove any previous labels
#set xtic auto                          # set ytics automatically
#set ytic auto                          # set ytics automatically
set title " 2009 "
set xlabel "Research Term"
set ylabel "Frequency"
set key inside right top vertical 
set key autotitle columnheader 
plot "../results/trending_words_by_year/trending.2009.txt" using 1:xtic(2) with boxes notitle
