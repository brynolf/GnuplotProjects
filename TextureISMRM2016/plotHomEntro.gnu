reset
set terminal epslatex standalone color size 12cm,12cm
set output 'plotHomEntro.tex'
set multiplot layout 2,2 rowsfirst
set datafile separator ","
## set logscale y
## set ytics 0.1,100
set yrange [-1:10]
set ytics 0,1,9
set xrange [0:1]
set xtics 0.1,0.15,.9
## set mytics 10
## set xtics -.3,.3,1.2

set label 'Homogeneity' at screen .47,.03
set label 'Entropy' at screen .047,.48 rotate by 90

set ylabel " " offset 0,0
set xtics format " " 
set lmargin at screen 0.13
set rmargin at screen 0.55
set bmargin at screen 0.55
set label '\huge a' at screen .17,.60
set key right top reverse width -4
plot 'GLCMSize_Homogeneity2_Entropy.dat' using 1:2 with dots lw 1.5 lc rgb "#22CC22"  notitle,\
	'' using (-100):(-100) with point pt 7 lc rgb "#22CC22" t '$8 \times 8\phantom{28}$',\
	'' using 3:4 with dots lw 1.5 lc rgb "#CC2222" notitle,\
	'' using (-100):(-100) with point pt 7 lc rgb "#CC2222" t '$16 \times 16\phantom{8}$',\
	'' using 5:6 with dots lw 1.5 lc rgb "#2222CC" notitle,\
	'' using (-100):(-100) with point pt 7 lc rgb "#2222CC" t '$32 \times 32\phantom{8}$',\
	'' using 7:8 with dots lw 1.5 lc rgb "#22CCCC" notitle,\
	'' using (-100):(-100) with point pt 7 lc rgb "#22CCCC" t '$64 \times 64\phantom{8}$',\
	'' using 9:10 with dots lw 1.5 lc rgb "#CC22CC" notitle,\
	'' using (-100):(-100) with point pt 7 lc rgb "#CC22CC" t '$128 \times 128$',\
	
unset label
set label '\huge b' at screen .60,.60	
set ylabel	
set lmargin
set rmargin at screen 0.98
set ytics format " " 
set key right top reverse width -2 Left
plot 'GLCMWind_Homogeneity2_Entropy.dat' using 1:2 with dots lw 1.5 lc rgb "#22CC22"  notitle,\
	'' using (-100):(-100) with point pt 7 lc rgb "#22CC22" t 'Manual',\
	'' using 3:4 with dots lw 1.5 lc rgb "#CC2222" notitle,\
	'' using (-100):(-100) with point pt 7 lc rgb "#CC2222" t 'AutoROI',\
	'' using 5:6 with dots lw 1.5 lc rgb "#2222CC" notitle,\
'' using (-100):(-100) with point pt 7 lc rgb "#2222CC" t 'AutoSlice'	

set lmargin at screen 0.13
unset label
set label '\huge c' at screen .17,.16	
set ylabel " " offset 0,0	
set xlabel " " offset 0,0
set rmargin at screen 0.55
set bmargin
set tmargin at screen 0.53
## set tmarging 0.12 	
set xtics format "%g"	
set ytics format "%g"
set key right top reverse width -3 Right
plot 'Noise_Homogeneity2_Entropy.dat' using 1:2 with dots lw 1.5 lc rgb "#22CC22"  notitle,\
	'' using (-100):(-100) with point pt 7 lc rgb "#22CC22"  t '$\sigma = 17$',\
	'' using 3:4 with dots lw 1.5 lc rgb "#CC2222" notitle,\
	'' using (-100):(-100) with point pt 7 lc rgb "#CC2222"  t '$\sigma = 51$',\
	'' using 5:6 with dots lw 1.5 lc rgb "#2222CC" notitle,\
	'' using (-100):(-100) with point pt 7 lc rgb "#2222CC"  t '$\sigma = 85$'
unset label
set label '\huge d' at screen .60,.16	
set ylabel
set lmargin
set rmargin at screen 0.98
set ytics format " " 
set key right top reverse width -16
plot 'ResNoise_Homogeneity2_Entropy.dat' using 1:2 with dots lw 1.5 lc rgb "#22CC22"  notitle,\
	'' using 3:4 with dots lw 1.5 lc rgb "#CC2222" notitle,\
	'' using 5:6 with dots lw 1.5 lc rgb "#2222CC" notitle,\
	'' using 7:8 with dots lw 1.5 lc rgb "#22CCCC" notitle,\
	'' using 9:10 with dots lw 1.5 lc rgb "#CC22CC" notitle,\
	'' using 11:12 with dots lw 1.5 lc rgb "#CCCC22" notitle,\
	'' using 13:14 with dots lw 1.5 lc rgb "#CC2222" notitle,\
	'' using 15:16 with dots lw 1.5 lc rgb "#2222CC" notitle,\
	'' using 17:18 with dots lw 1.5 lc rgb "#222222" notitle
	
	
	
	'' using (-100):(-100) with point pt 7 lc rgb "#22CC22"  t '\tiny $\Delta x = 1.2 mm, \sigma=17$',\
	'' using (-100):(-100) with point pt 7 lc rgb "#CC2222"  t '\tiny $\Delta x = 1.2 mm, \sigma=51$',\
	'' using (-100):(-100) with point pt 7 lc rgb "#2222CC" t '\tiny $\Delta x = 1.2 mm, \sigma=85$',\
	'' using (-100):(-100) with point pt 7 lc rgb "#22CCCC"  t '\tiny $\Delta x = 1.8 mm, \sigma=17$',\
	'' using (-100):(-100) with point pt 7 lc rgb "#CC22CC"  t '\tiny $\Delta x = 1.8 mm, \sigma=51$',\
	'' using (-100):(-100) with point pt 7 lc rgb "#CCCC22"  t '\tiny $\Delta x = 1.8 mm, \sigma=85$',\
	'' using (-100):(-100) with point pt 7 lc rgb "#CC2222"  t '\tiny $\Delta x = 3.6 mm, \sigma=17$',\
	'' using (-100):(-100) with point pt 7 lc rgb "#2222CC"  t '\tiny $\Delta x = 3.6 mm, \sigma=51$',\
	'' using (-100):(-100) with point pt 7 lc rgb "#222222"  t '\tiny $\Delta x = 3.6 mm, \sigma=85$'