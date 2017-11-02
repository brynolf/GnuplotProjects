reset
set terminal epslatex standalone color size 12cm,12cm
set output 'plotCorrContr.tex'
set multiplot layout 2,2 rowsfirst
set datafile separator ","
set logscale y
## set ytics 0.1,100
set ytics .01,10,8000
set mytics 10
set xrange [-.4:1]
set xtics -.3,.3,1.2


set label 'Correlation' at screen .47,.03
set label 'Contrast' at screen .03,.48 rotate by 90

set ylabel " " offset 2,0
set xtics format " " 
set rmargin at screen 0.55
set bmargin at screen 0.55
set label '\huge a' at screen .17,.60
plot 'GLCMSize_correlation_contrast.dat' using 1:2 with dots lw 2lc rgb "#22CC22"  notitle,\
	'' using 3:4 with dots lw 2lc rgb "#CC2222" notitle,\
	'' using 5:6 with dots lw 2lc rgb "#2222CC" notitle,\
	'' using 7:8 with dots lw 2lc rgb "#22CCCC" notitle,\
	'' using 9:10 with dots lw 2lc rgb "#CC22CC" notitle
	
unset label
set label '\huge b' at screen .60,.60
set ylabel	
set rmargin at screen 0.98
set ytics format " " 
plot 'GLCMWind_correlation_contrast.dat' using 1:2 with dots lw 2lc rgb "#22CC22"  notitle,\
	'' using 3:4 with dots lw 2lc rgb "#CC2222" notitle,\
	'' using 5:6 with dots lw 2lc rgb "#2222CC" notitle	


unset label
set label '\huge c' at screen .17,.16
set ylabel " " offset 2,0	
set xlabel " " offset 0,0
set rmargin at screen 0.55
set bmargin
set tmargin at screen 0.53
## set tmarging 0.12 	
set xtics format "%g"	
set ytics format "%g"
plot 'Noise_correlation_contrast.dat' using 1:2 with dots lw 2lc rgb "#22CC22"  notitle,\
	'' using 3:4 with dots lw 2lc rgb "#CC2222" notitle,\
	'' using 5:6 with dots lw 2lc rgb "#2222CC" notitle	

unset label
set label '\huge d' at screen .60,.16	
set ylabel
set rmargin at screen 0.98
set ytics format " " 
plot 'ResNoise_correlation_contrast.dat' using 1:2 with dots lw 2lc rgb "#22CC22"  notitle,\
	'' using 3:4 with dots lw 2lc rgb "#CC2222" notitle,\
	'' using 5:6 with dots lw 2lc rgb "#2222CC" notitle,\
	'' using 17:18 with dots lw 2lc rgb "#22CCCC" notitle,\
	'' using 9:10 with dots lw 2lc rgb "#CC22CC" notitle,\
	'' using 11:12 with dots lw 2lc rgb "#CCCC22" notitle,\
	'' using 13:14 with dots lw 2lc rgb "#CC2222" notitle,\
	'' using 15:16 with dots lw 2lc rgb "#2222CC" notitle,\
	'' using 7:8 with dots lw 2lc rgb "#222222" notitle