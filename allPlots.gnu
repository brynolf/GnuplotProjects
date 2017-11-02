reset
## termName = "epslatex standalone size 60cm,50cm"
set term epslatex standalone size 60cm,50cm
set output 'allPlots.tex'
set datafile separator ","

set xdata time
set timefmt "%Y-%m-%d"
set mxtics 14
set format x '\footnotesize %d/%m'


set multiplot layout 4,3

file = 'date3.dat'

set style line 1 lc rgb "#0000DD" pointsize 1 lt 5
set style line 2 linewidth 2 lc rgb "#000055" lt 5
set style line 3 lc rgb "#00AA77" pointsize 1 lt 5
set style line 4 linewidth 2 lc rgb "#005500" lt 5

set style line 5 lc rgb "#A00A00" pointsize 1 lt 5
set style line 6 linewidth 2 lc rgb "#500500" lt 5
set style line 7 lc rgb "#888800" pointsize 1 lt 5
set style line 8 linewidth 2 lc rgb "#003333" lt 5

##================== Diameter, slice 1
set title "Diameters, slice 1"
set ylabel "Diameter, [cm]"

## Get stats of data for y-range
unset xdata 
unset yrange
ymin = 18.7
ymax = 19.3

do for [ind=9:15:2] {
stats 'date3.dat' using ind

guideLimitHigh = 19.2
guideLimitLow  = 18.8

if (STATS_min < ymin){ymin = STATS_min -.1}	
if (STATS_max > ymax){ymax = guideLimitHigh +.1}

}
set yrange [ymin:ymax]
set xdata time	

plot [:][:] file using 1:9 with points ls 1 notitle,\
	"" using 1:11 with points ls 3 notitle,\
	"" using 1:13 with points ls 5 notitle,\
	"" using 1:15 with points ls 7 notitle,\
	"" using 1:(guideLimitHigh) with lines lt 4 lc rgb "#DD0000" notitle,\
	"" using 1:(guideLimitLow)  with lines lt 4 lc rgb "#DD0000" notitle
unset yrange
##================== Diameter, slice 5
set title "Diameters, slice 5"
set ylabel "Diameter, [cm]"

## Get stats of data for y-range
unset xdata 
ymin = 18.7
ymax = 19.3

do for [ind=10:16:2] {
stats 'date3.dat' using ind

guideLimitHigh = 19.2
guideLimitLow  = 18.8

if (STATS_min < ymin){ymin = STATS_min -.1}	
if (STATS_max > ymax){ymax = guideLimitHigh +.1}

}
set yrange [ymin:ymax]
set xdata time	

	plot file using 1:10 with points ls 1 notitle,\
	"" using 1:12 with points ls 3 notitle,\
	"" using 1:14 with points ls 5 notitle,\
	"" using 1:16 with points ls 7 notitle,\
	"" using 1:(19.2) with lines lt 4 lc rgb "#DD0000" notitle,\
	"" using 1:(18.8) with lines lt 4 lc rgb "#DD0000" notitle
	
##================== Ghosting Ratio
unset yrange
set title "Ghosting Ratio"
set ylabel "Ghosting Ratio"
plot file using 1:4 with points ls 1 notitle

##================== PUI
unset xdata 
ymin = 81
stats 'date3.dat' using 3
if (STATS_min < ymin){ymin = STATS_min - 1}	
set xdata time	
set yrange [ymin:STATS_max+1]

set title "Percent Uniformity Integral"
set ylabel "PUI, [\\%]"
plot file using 1:3 with points ls 1 notitle,\
	"" using 1:(82) with lines lc rgb "#DD0000" notitle
unset yrange
##================== Slice Thickness
unset xdata 
stats 'date3.dat' using 17
ymax  = 5.8
ymin  = 4.2
if (STATS_min < ymin){ymin = STATS_min -.1}	
if (STATS_max > ymax){ymax = STATS_max +.1}
set xdata time
set yrange [ymin:ymax]

set title "Slice Thickness"
set ylabel "Slice Thickness, [mm]"
plot file using 1:17 with points ls 1 notitle,\
	"" using 1:(5.7) with lines lt 5 lc rgb "#DD0000" notitle,\
	"" using 1:(4.3) with lines lt 5 lc rgb "#DD0000" notitle
unset yrange
##================== Slice position Accuracy
unset xdata 
do for [ind=7:8] {
stats 'date3.dat' using ind
ymax  = 5.5
ymin  = 4.5
if (STATS_min < ymin){ymin = STATS_min -.5}	
if (STATS_max > ymax){ymax = STATS_max +.5}
}
set xdata time
set yrange [ymin:ymax]

set title "Slice Position Accuracy"
set ylabel "Slice Position Accuracy, [mm]"

plot file using 1:7 with points ls 1 t 'Slice 1',\
	"" using 1:8 with points ls 3 t 'Slice 11',\
	"" using 1:(5) with lines lt 4 lc rgb "#DD0000" notitle,\
	"" using 1:(-5) with lines lt 4 lc rgb "#DD0000" notitle
unset yrange
##================== SNR

set title "Signal to Noise Ratio"
set ylabel "SNR"
plot file using 1:24 with points ls 1 notitle

##================== Signal
set title "Signal"
set ylabel "Signal [A.u.]"
plot file using 1:29 with points ls 1 notitle

##================== Noise
set title "Noise"
set ylabel "Noise, [A.u.]"
plot file using 1:28 with points ls 1 notitle

##================== Frequency
set size .5,.24
set format y '%3.5f'
set title "Imaging Frequency"
set ylabel "Imaging Frequency, [MHz]"
set y2label "Mag. Fieldstrength, [T]"
FACTOR=42.576
set link y2 via y/FACTOR inverse y*FACTOR
set format y2 '%3.6f'
set ytics nomirror
set y2tics 
plot file using 1:25 with points ls 1 notitle

##================== High Contrast resolution
## set origin 0.53, 0
## set size 0.45,.24
## set format y '%g'
## set format y2 '%g'
## unset y2tics
## set title 'High Contrast Resolution'
## set ylabel "HCR"
## plot file using 1:($18 + $19 + $20 + $21) with points ls 1 notitle
unset y2label
unset y2tics
set origin 0.53, 0
set size 0.45,.24
set title "SNR vs noise"
set ylabel "SNR"
set xlabel "Noise"
set xdata
set format x '%g'

plot file using 28:29 with points ls 1 notitle
##================== PUI