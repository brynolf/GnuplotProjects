reset
set term epslatex standalone size 13cm,8cm 
set output 'SliceThickness.tex'
set datafile separator ","

## set key outside
set title 'Slice Thickness'
set xdata time
set timefmt "%Y-%m-%d"
## set timefmt "%H:%M:%S"
set xtics rotate by 45 offset 0,-1
## set logscale y
set yrange [4.1:5.9]

set mxtics 14

set ylabel 'Slice Thickness [mm]'
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

plot "date2.dat" using 1:17 with points ls 1 notitle,\
	"" using 1:(5.7) with lines lt 5 lc rgb "#DD0000" notitle,\
	"" using 1:(4.3) with lines lt 5 lc rgb "#DD0000" notitle

	