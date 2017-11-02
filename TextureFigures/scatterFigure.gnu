reset
set terminal epslatex standalone color size 15cm, 10cm font "cmr,8" 
set output 'scatterFigure.tex'

set multiplot layout 2,2 rowsfirst

pointType = 7
pointSize = 0.5

set linetype  1 lc rgb "#336699" pt pointType ps pointSize
 set linetype  2 lc rgb "#99CCFF" pt pointType ps pointSize
 set linetype  3 lc rgb "#999933" pt pointType ps pointSize
 set linetype  4 lc rgb "#666699" pt pointType ps pointSize
 set linetype  5 lc rgb "#CC9933" pt pointType ps pointSize
 set linetype  6 lc rgb "#006666" pt pointType ps pointSize
 set linetype  7 lc rgb "#3399FF" pt pointType ps pointSize
 set linetype  8 lc rgb "#993300" pt pointType ps pointSize  
 set linetype  9 lc rgb "#CCCC99"  pt pointType ps pointSize
 set linetype  10 lc rgb "#666666"  pt pointType ps pointSize
 set linetype  11 lc rgb "#FFCC66"  pt pointType ps pointSize
 set linetype  12 lc rgb "#6699CC"  pt pointType ps pointSize
 set linetype  13 lc rgb "#663366"  pt pointType ps pointSize
 set linetype  14 lc rgb "#9999CC"  pt pointType ps pointSize
 set linetype  15 lc rgb "#CCCCCC"  pt pointType ps pointSize
 set linetype cycle  15

set logscale y

set tics front
set mytics 10 
set ylabel 'Contrast' offset 3,0
set xlabel 'Correlation'
set title 'GLCM Size'
set key invert width -0.5 height 0.1 spacing 0.8 samplen 0.5
set rmargin 0
set xrange [0:1.1]
plot 'GLCMResContrastCorrelation.csv' using 6:1 with points  t '$8\times8$',\
	'' using 7:2 with points  t '$16\times16$',\
	'' using 8:3 with points  t '$32\times32$',\
	'' using 9:4 with points  t '$64\times64$',\
	'' using 10:5 with points  t '$128\times128$'
	

unset rmargin
unset ylabel
set ytics format "" 
set title 'Noise'
set key
plot 'NoiseContrastCorrelation.csv' using 4:1 with points   t '$\sigma=17$',\
	'' using 5:2 with points  t '$\sigma=51$',\
	'' using 6:3 with points  t '$\sigma=85$'

## unset ylabel
## set ytics format "" 
## set title 'Noise $\times$ GLCM Size'
## plot 'GLCMResNoiseContrastCorrelation.csv' using 16:1 with points   notitle,\
	## '' using 17:2 with points  notitle,\
	## '' using 18:3 with points  notitle,\
	## '' using 19:4 with points  notitle,\
	## '' using 20:5 with points  notitle,\
	## '' using 21:6 with points  notitle,\
	## '' using 22:7 with points  notitle,\
	## '' using 23:8 with points  notitle,\
	## '' using 24:9 with points  notitle,\
	## '' using 25:10 with points  notitle,\
	## '' using 26:11 with points  notitle,\
	## '' using 27:12 with points  notitle,\
	## '' using 28:13 with points  notitle,\
	## '' using 29:14 with points  notitle,\
	## '' using 30:15 with points  notitle
	
	## unset ylabel
## set ytics format "" 
## set title 'Noise $\times$  Freq. Res'
## plot 'FreqResNoiseContrastCorrelation.csv' using 10:1 with points   notitle,\
	## '' using 11:2 with points  notitle,\
	## '' using 12:3 with points  notitle,\
	## '' using 13:4 with points  notitle,\
	## '' using 14:5 with points  notitle,\
	## '' using 15:6 with points  notitle,\
	## '' using 16:7 with points  notitle,\
	## '' using 17:8 with points  notitle,\
	## '' using 18:9 with points  notitle

unset xrange
set ylabel 'Entropy' offset -1.5,0
set xlabel 'Homogeneity'
unset logscale y
unset mytics 
set title 'GLCM Size'
set ytics format "%g" 
set xtics 0.2
set rmargin 0
plot 'GLCMResEntropyHomogeneity.csv' using 6:1 with points   t '$8\times 8$',\
	'' using 7:2 with points  t '$16\times16$',\
	'' using 8:3 with points  t '$32\times32$',\
	'' using 9:4 with points  t '$64\times64$',\
	'' using 10:5 with points  t '$128\times128$'
	
unset lmargin
unset rmargin
unset ylabel
set ytics format "" 
set title 'Noise'
set key
plot 'NoiseEntropyHomogeneity.csv' using 4:1 with points   t '$\sigma=17$',\
	'' using 5:2 with points  t '$\sigma=51$',\
	'' using 6:3 with points  t '$\sigma=85$'
	
	
## unset ylabel
## set ytics format "" 
## set title 'Noise $\times$  GLCM Size'
## plot 'GLCMResNoiseEntropyHomogeneity.csv' using 16:1 with points   notitle,\
	## '' using 17:2 with points  notitle,\
	## '' using 18:3 with points  notitle,\
	## '' using 19:4 with points  notitle,\
	## '' using 20:5 with points  notitle,\
	## '' using 21:6 with points  notitle,\
	## '' using 22:7 with points  notitle,\
	## '' using 23:8 with points  notitle,\
	## '' using 24:9 with points  notitle,\
	## '' using 25:10 with points  notitle,\
	## '' using 26:11 with points  notitle,\
	## '' using 27:12 with points  notitle,\
	## '' using 28:13 with points  notitle,\
	## '' using 29:14 with points  notitle,\
	## '' using 30:15 with points  notitle
	
		## unset ylabel
## set ytics format "" 
## set title 'Noise $\times$  Freq. Res'
## plot 'FreqResNoiseEntropyHomogeneity.csv' using 10:1 with points   notitle,\
	## '' using 11:2 with points  notitle,\
	## '' using 12:3 with points  notitle,\
	## '' using 13:4 with points  notitle,\
	## '' using 14:5 with points  notitle,\
	## '' using 15:6 with points  notitle,\
	## '' using 16:7 with points  notitle,\
	## '' using 17:8 with points  notitle,\
	## '' using 18:9 with points  notitle