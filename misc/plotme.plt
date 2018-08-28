set terminal png size 800,500 enhanced
set output "../results/meditation_research_at_universities.png
set   autoscale                        # scale axes automatically
set style fill solid 1.0 border rgb 'grey10'
set boxwidth 0.3
unset log                              # remove any log-scaling
#unset label                            # remove any previous labels
#set xtic auto                          # set ytics automatically
set ytic auto                          # set ytics automatically
set title "Meditation Research Universities"
set xlabel "University"
set ylabel "Number of Pub"
set yrange [10:35]
set key inside right top vertical 
set key autotitle columnheader 
plot "../results/meditation_research_at_universities.txt" using 1:xtic(2) with boxes notitle
