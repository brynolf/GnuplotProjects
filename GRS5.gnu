reset
set term epslatex standalone size 13cm,8cm 
set output 'GRS5.tex'

set title 'Ghosting Ratio Slice 5'
set xdata time
set timefmt "%Y-%m-%d"
## set timefmt "%H:%M:%S"
set xtics rotate by 45 offset 0,-1
set logscale y

set mxtics 14

set ylabel 'Ghosting Ratio Slice 5'
set xlabel 'Dates' offset 0,0
set format x '\footnotesize %d/%m'

set grid

set style line 1 lc rgb "#0000DD" pointsize .5 lt 4
set style line 2 linewidth 2 lc rgb "#000055" lt 4

plot "date.dat" using 1:5 with points ls 1 notitle,\
	"" using 1:5 with steps ls 2 notitle