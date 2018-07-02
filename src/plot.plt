# Gnuplot script file for plotting data in file "force.dat"
 set terminal png size 1500,1200 enhanced
 set output 'output.png'
 set   autoscale                        # scale axes automatically
 set style fill solid
 unset log                              # remove any log-scaling
 unset label                            # remove any previous labels
 set xtic auto                          # set xtics automatically
 set ytic auto                          # set ytics automatically
 set title "title"
 set xlabel "X"
 set ylabel "Y"
 #set key 0.01,100
 #set label "Yield Point" at 0.003,260
 #set arrow from 0.0028,250 to 0.003,280
 #set xr [0.0:0.022]
#set yr [0:325]
 plot "top_10_keywords_by_freq.txt" using 1:xtic(2) with boxes
