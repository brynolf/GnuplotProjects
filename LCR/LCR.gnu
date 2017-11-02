reset
set terminal epslatex standalone size 10cm,10cm
set output 'LCR.tex'

set style fill solid 0.15
## set style boxplot outliers pointtype 3
## set style data boxplot
## set style boxplot nooutliers
set bars 1.0
set yrange [0:11]
set xrange [0:5]

plot for [slice = 0:3] 'data.dat' index slice using 1:2:3:4:5 with candlesticks notitle,\
	for [slice = 0:3] 'data2.dat' index slice using 1:2 with points pt 9 notitle,\
	for [slice = 0:3] 'data2.dat' index slice using 1:3 with points pt 5 notitle,\
	for [slice = 0:3] 'data2.dat' index slice using 1:4 with points pt 7 notitle
