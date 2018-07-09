 set terminal png enhanced
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
 plot "top_10_keywords_by_freq.txt" using 1:xtic(2) with boxes
