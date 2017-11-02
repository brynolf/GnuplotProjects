reset
set terminal epslatex standalone color size 13cm, 15cm header \
"\\usepackage[bitstream-charter]{mathdesign}"
set output 'imageMatrixInv.tex'
## set size ratio -1
set multiplot
set datafile separator ','
tbuffer = 0.06
vbuffer = 0.06
bbuffer = 0.06
lbuffer = 0.06
hbuffer = 0.04
rbuffer = 0.1
imgwidth = (1-(lbuffer+rbuffer+2*hbuffer))/3
imgheight = (1-(tbuffer+bbuffer+2*vbuffer))/3
## imgheight = imgwidth*325/270

set style line 1 dt 1 lc rgb "#000000" lw 2
set style line 2 dt 2 lc rgb "#000000" lw 2 
set style line 3 dt 3 lc rgb "#000000" lw 2 
set style line 4 dt 4 lc rgb "#000000" lw 2
set style line 5 dt 7 lc rgb "#000000" lw 2 

unset border
unset xtics
unset ytics

# FIRST ROW
set ylabel '8 gray levels'
set title 'Max level 10k'

set lmargin at screen lbuffer
set rmargin at screen lbuffer+imgwidth
set bmargin at screen bbuffer+2*vbuffer+2*imgheight
set tmargin at screen bbuffer+2*vbuffer+3*imgheight
plot 'Image_GL8_L10000.png' binary filetype=png with rgbimage notitle

unset ylabel
set title 'Max level 30k'
set lmargin at screen lbuffer+1*hbuffer+1*imgwidth
set rmargin at screen lbuffer+1*hbuffer+imgwidth*2
plot 'Image_GL8_L30000.png' binary filetype=png with rgbimage notitle

set logscale y2
set logscale y
set border
set xtics 10000,20000,30000 format '$%1.0s \textrm{%c}$' 
set xlabel 'Max level' offset 0,1.5
set y2tics format '$10^{%T}$'
set y2tics mirror
set my2tics 10
set lmargin at screen lbuffer+2*hbuffer+2*imgwidth
set rmargin at screen lbuffer+2*hbuffer+imgwidth*3
set title 'Features'
plot 'contrast8bitInv.dat' using 1:2 with lines ls 1 notitle,\
	'energy8bitInv.dat' using 1:2 with lines ls 2 notitle,\
	'entropy8bitInv.dat' using 1:($2*-1) with lines ls 3 notitle,\
	'homogeneity8bitInv.dat' using 1:2 with lines ls 4 notitle,\
	'autocorrelation8bitInv.dat' using 1:2 with lines ls 5 notitle

# SECOND ROW
unset title
unset xlabel
unset logscale y2
unset logscale y
unset border
unset xtics
unset y2tics 
unset ytics

set ylabel '128 gray levels'
set lmargin at screen lbuffer
set rmargin at screen lbuffer+imgwidth
set bmargin at screen bbuffer+1*vbuffer+1*imgheight
set tmargin at screen bbuffer+1*vbuffer+2*imgheight
plot 'Image_GL128_L10000.png' binary filetype=png with rgbimage notitle

unset ylabel
set lmargin at screen lbuffer+1*hbuffer+1*imgwidth
set rmargin at screen lbuffer+1*hbuffer+imgwidth*2
plot 'Image_GL128_L30000.png' binary filetype=png with rgbimage notitle

set logscale y 
set logscale y2
set border
set xtics
set y2tics mirror
set my2tics 10

set xlabel 'Max level' offset 0,1.5
set lmargin at screen lbuffer+2*hbuffer+2*imgwidth
set rmargin at screen lbuffer+2*hbuffer+imgwidth*3
plot 'contrast128bitInv.dat' using 1:2 with lines ls 1 notitle,\
	'energy128bitInv.dat' using 1:2 with lines ls 2 notitle,\
	'entropy128bitInv.dat' using 1:($2*-1) with lines ls 3 notitle,\
	'homogeneity128bitInv.dat' using 1:2 with lines ls 4 notitle,\
	'autocorrelation128bitInv.dat' using 1:2 with lines ls 5 notitle
	
# THIRD ROW
## unset y2tics
## set ytics
## set my2tics 10
## set logscale y
set yrange [1e-4:1e3]
set y2tics mirror format ' '
set ylabel 'Featues'
set xlabel 'Gray levels' offset 0,1.5
set lmargin at screen lbuffer
set rmargin at screen lbuffer+imgwidth
set bmargin at screen bbuffer+0*vbuffer+0*imgheight
set tmargin at screen bbuffer+0*vbuffer+1*imgheight
set xtics 8,120,128 
plot 'contrast10kInv.dat' using 1:2 with lines ls 1 notitle,\
	'energy10kInv.dat' using 1:2 with lines ls 2 notitle,\
	'entropy10kInv.dat' using 1:($2*-1) with lines ls 3 notitle,\
	'homogeneity10kInv.dat' using 1:2 with lines ls 4 notitle,\
	'autocorrelation30kInv.dat' using 1:2 with lines ls 5 notitle
	
unset ylabel
set y2tics mirror format '$10^{%T}$'
set key at screen lbuffer+2*hbuffer+3*imgwidth+.05,bbuffer+0*vbuffer+1*imgheight reverse Left  
set lmargin at screen lbuffer+1*hbuffer+1*imgwidth
set rmargin at screen lbuffer+1*hbuffer+imgwidth*2
plot 'contrast30kInv.dat' using 1:2 with lines ls 1 title 'Contrast',\
	'energy30kInv.dat' using 1:2 with lines ls 2 title 'Energy',\
	'entropy30kInv.dat' using 1:($2*-1) with lines ls 3 title 'Entropy',\
	'homogeneity30kInv.dat' using 1:2 with lines ls 4 title 'Homogen.',\
	'autocorrelation30kInv.dat' using 1:2 with lines ls 5 title 'Autocorr.'
