reset
set term epslatex standalone size 13cm,8cm 
set output 'SNRtime.tex'

set title 'SNR'
set xdata time
## set timefmt "%Y-%m-%d"
set timefmt "%H:%M:%S"
set xtics format '\tiny %H.%M' rotate by 45 offset -1,-1

set ylabel 'SNR'
set xlabel 'Time'

set grid

set style line 1 lc rgb "#0000DD" pointsize .5 lt 4
set style line 2 linewidth 2 lc rgb "#000055" lt 4

plot "date.dat" using 2:24 with points ls 1 notitle
	"" using 2:24 with steps ls 2 notitle