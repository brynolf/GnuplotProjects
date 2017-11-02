reset
set term epslatex standalone size 13cm,8cm 
set output 'SNRweekday.tex'
set datafile separator ","
set title 'SNR'
set xdata time
set timefmt "%A"
## set timefmt "%H:%M:%S"
set xtics format '\tiny %A' rotate by 45 offset -1,-1

set ylabel 'SNR'
set xlabel 'Time'

set grid

set style line 1 lc rgb "#0000DD" pointsize .5 lt 4
set style line 2 linewidth 2 lc rgb "#000055" lt 4

plot "weekdat.dat" using 1:2 with points ls 1 notitle,\
	"" using 1:2 with steps ls 2 notitle