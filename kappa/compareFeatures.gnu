reset
set terminal epslatex standalone color size 13cm, 5cm header \
"\\usepackage[bitstream-charter]{mathdesign}"
set output 'compareFeatures.tex'
## set size ratio -1
set multiplot
set datafile separator ','
tbuffer = 0.12
bbuffer = 0.2
lbuffer = 0.12
hbuffer = 0.04
rbuffer = 0.25
imgwidth = (1-(lbuffer+rbuffer+hbuffer))/2
imgheight = (1-(tbuffer+bbuffer))
## imgheight = imgwidth*325/270

set style line 1 dt 1 lc rgb "#000000" lw 2
set style line 2 dt 2 lc rgb "#000000" lw 2 
set style line 3 dt 3 lc rgb "#000000" lw 2 
set style line 4 dt 4 lc rgb "#000000" lw 2
set style line 5 dt 7 lc rgb "#000000" lw 2 

set ytics mirror format '$10^{%T}$'
set logscale y
set mytics 10
## set xrange [8:32]
set yrange [1e-3:1e4]
set xtics 0,32,128
set mxtics 4
## set key at screen lbuffer+2*hbuffer+3*imgwidth+.05,bbuffer+0*vbuffer+1*imgheight reverse Left  
set lmargin at screen lbuffer
set rmargin at screen lbuffer+imgwidth
set tmargin at screen bbuffer+imgheight
set bmargin at screen bbuffer
set title 'Original features' offset 0,-.5
set ylabel 'Feature values' offset 1.5,0
set xlabel 'Gray levels' offset 0,.5
plot 'contrast10k.dat' using 1:2 with lines ls 1 notitle,\
	'energy10k.dat' using 1:2 with lines ls 2 notitle,\
	'entropy10k.dat' using 1:($2) with lines ls 3 notitle,\
	'homogeneity10k.dat' using 1:2 with lines ls 4 notitle,\
	'autocorrelation10k.dat' using 1:2 with lines ls 5 notitle
	
unset ylabel
set ytics format " "
set autoscale y
set key at screen lbuffer+hbuffer+2*imgwidth+.28,.85 reverse Left
set lmargin at screen lbuffer+hbuffer+imgwidth
set rmargin at screen lbuffer+hbuffer+imgwidth*2	
set title 'Invariant features'
plot 'contrast10kInv.dat' using 1:2 with lines ls 1 title 'Contrast',\
	'energy10kInv.dat' using 1:2 with lines ls 2 title 'Energy',\
	'entropy10kInv.dat' using 1:($2*-1) with lines ls 3 title 'Entropy',\
	'homogeneity10kInv.dat' using 1:2 with lines ls 4 title 'Homogen.',\
	'autocorrelation10kInv.dat' using 1:2 with lines ls 5 title 'Autocorr.'
