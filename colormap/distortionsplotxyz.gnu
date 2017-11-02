reset
set terminal epslatex standalone color size 11cm,8cm
set datafile separator ","
set output 'distortionsplotxyz.tex'
set multiplot title '\textbf{SIGNA PET/MR, 20150415, $\textbf{BW = 488.28}$ Hz/pixel}' layout 2,1


load 'moreland.pal' 

set xtics offset 0,0.3
set format x ""
set ytics  offset 0.5
set yrange [-30:30]
set ytics -20,10
unset colorbox
set xrange [0:310]
set bmargin 0
set lmargin 1.3
set tmargin 1.5
set ylabel 'Distortion (mm)' offset 1.7,0
set cbrange [-4:4]
## set lmargin 0 
set rmargin 0.1
set colorbox
set grid 
set key left
set key spacing 0.7

## set size 0.98,0.45
plot 	'xyzerror.txt' 	using 4:1 with points pt 7 ps 0.5 lc rgb "#3b4cc0" t 'x error',\
		''				using 4:2 with points pt 7 ps 0.5 lc rgb "#b40426" t 'y error',\
		'' 				using 4:3 with points pt 7 ps 0.5 lc rgb "#f7a789" t 'z error' 
		
unset datafile separator
set ylabel 'Distortion (mm)' offset 0.7,0
set lmargin 1.3
set bmargin 1.5
set tmargin 0
set xtics offset 0,0.3
set format x "%g"
set yrange [0:30]
set ytics 0,5, 25
## set label 'Distance from isocenter (mm)' offset 15,-1.7
set xlabel 'Distance from isocenter (mm)' offset 0,0.8
set cbtics 1 offset -0.5,0
set xtics 
set cbrange [-4:4]
## set lmargin 0 
set rmargin 0.1
## set size 0.98,0.49
set colorbox vertical user origin 0.05,0.1395 size 0.04,0.27
plot 	'totalerror.txt' using 2:1:1 with points pt 7 ps 0.5 palette notitle 
unset label 