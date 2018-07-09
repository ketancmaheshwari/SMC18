#!/bin/bash

for i in ../results/trending_words_by_year/trending.200?.txt
do
year=$(echo $i|awk -F. '{print $4}')
#echo $year
cat << END >plotme.plt
set terminal png size 800,500 enhanced
set output "$i.png"
set   autoscale                        # scale axes automatically
set style fill solid 1.0 border rgb 'grey10'
set boxwidth 0.5
unset log                              # remove any log-scaling
#unset label                            # remove any previous labels
#set xtic auto                          # set ytics automatically
#set ytic auto                          # set ytics automatically
set title " $year "
set xlabel "Research Term"
set ylabel "Frequency"
set key inside right top vertical 
set key autotitle columnheader 
plot "$i" using 1:xtic(2) with boxes notitle
END
gnuplot plotme.plt
done
