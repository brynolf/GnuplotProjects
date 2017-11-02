reset
set term epslatex standalone size 13cm,8cm 
set output 'DiameterSlice1.tex'
set datafile separator ","

## set key outside
set title 'Diameter Slice 1'
set xdata time
set timefmt "%Y-%m-%d"
## set timefmt "%H:%M:%S"
set xtics rotate by 45 offset 0,-1
## set logscale y
set yrange [18.7:19.3]

set mxtics 14

set ylabel 'Diameter'
set xlabel 'Dates' offset 0,0
set format x '\footnotesize %d/%m'

set grid

set style line 1 lc rgb "#0000DD" pointsize .5 lt 4
set style line 2 linewidth 2 lc rgb "#000055" lt 4
set style line 3 lc rgb "#00DD00" pointsize .5 lt 4
set style line 4 linewidth 2 lc rgb "#005500" lt 4

set style line 5 lc rgb "#D00D00" pointsize .5 lt 4
set style line 6 linewidth 2 lc rgb "#500500" lt 4
set style line 7 lc rgb "#008888" pointsize .5 lt 4
set style line 8 linewidth 2 lc rgb "#003333" lt 4

plot "date2.dat" using 1:9 with points ls 1 notitle,\
	"" using 1:11 with points ls 3 notitle,\
	"" using 1:13 with points ls 5 notitle,\
	"" using 1:15 with points ls 7 notitle,\
	"" using 1:(19.2) with lines lt 4 lc rgb "#DD0000" notitle,\
	"" using 1:(18.8) with lines lt 4 lc rgb "#DD0000" notitle
	