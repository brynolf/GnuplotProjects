reset
set term epslatex standalone size 13cm,8cm 
set output 'HCR.tex'
set datafile separator ","


set title 'High Contrast Resolution'
set xdata time
set timefmt "%Y-%m-%d"
## set timefmt "%H:%M:%S"
set xtics rotate by 45 offset 0,-1
## set logscale y
set yrange [13:17]

set mxtics 14

set ylabel 'High Contrast Resolution'
set xlabel 'Dates' offset 0,0
set format x '\footnotesize %d/%m'

set grid

set style line 1 lc rgb "#0000DD" pointsize .5 lt 4
set style line 2 linewidth 2 lc rgb "#000055" lt 4

plot "date2.dat" using 1:($18 + $19 + $20 + $21) with points ls 1 notitle,\
	"" using 1:(15 + 1) with lines lc rgb "#DD0000" notitle
	