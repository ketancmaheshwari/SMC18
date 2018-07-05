#!/bin/bash

for i in {1801..2017}
do

awk 'BEGIN{OFS=",";print "id","value"}{print $2,$1}' ../results/trending_words_by_year/trending.$i.txt > bubble_data.csv
cat << END >grab_bubble_plot_phantom.js
 var page = require('webpage').create();
 page.open('http://localhost:8888', function(status) {
   console.log("Status: " + status);
   if(status === "success") {
     page.render("$i.png");
   }
   phantom.exit();
 });
END
sleep 10
~/phantomjs-2.1.1-macosx/bin/phantomjs grab_bubble_plot_phantom.js
done
