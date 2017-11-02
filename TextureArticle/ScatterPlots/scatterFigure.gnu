reset
set terminal epslatex standalone color size 12cm, 10cm font "cmr,8" 
set output 'scatterFigure.tex'

set multiplot layout 2,2 rowsfirst
set macros

## Load color map
load 'patrik2.pal'

## Set point type fof the plots
pointType = 7
pointSize = 0.4
pointSizeKey = 1
pointStyle = " pt pointType ps pointSize"
pointStyleKey = " pt pointType ps pointSizeKey"

## Set margins for the plots
leftBuffer = 0.1
middleBuffer = 0.02
endBuffer = 0.02
plotWidth  = (1-(leftBuffer+middleBuffer+endBuffer))/2

## Set position of a,b,c,d labels
POS = "at graph 0.08,0.1"

## Set key layout
set key invert width -0.9 height 0.1 spacing 0.8 samplen -1.2 nobox 

## Set tics in front
set tics front

## Set data file separator
set datafile separator ","

## Plot 1
set logscale y
set mytics 10 
set ylabel 'Contrast' offset 3,-1
set xlabel 'Correlation'
set title '\textbf{GLCM Size}'

set xrange [0:1.15]
set yrange [0.1:10000]
set xtics 0,0.2,1.2

set lmargin at screen leftBuffer
set rmargin at screen leftBuffer + plotWidth
set label 1 '\Huge a' @POS
plot 'GLCMResContrastCorrelation.csv' using 6:1 with points @pointStyle notitle,\
	'' using 7:2 with points @pointStyle notitle,\
	'' using 8:3 with points @pointStyle notitle,\
	'' using 9:4 with points @pointStyle notitle,\
	'' using 10:5 with points @pointStyle notitle,\
	.01 with points lt 1 @pointStyleKey t '\small$8\times8$',\
	.01 with points lt 2 @pointStyleKey t '\small$16\times16$',\
	.01 with points lt 3 @pointStyleKey t '\small$32\times32$',\
	.01 with points lt 4 @pointStyleKey t '\small$64\times64$',\
	.01 with points lt 5 @pointStyleKey t '\small$128\times128$'

unset ylabel
set ytics format "" 
set title '\textbf{Noise}'
set key
set xtics 0.2,0.2,1.2
set lmargin at screen leftBuffer + plotWidth + middleBuffer
set rmargin at screen leftBuffer + middleBuffer + 2*plotWidth
set label 1 '\Huge b' @POS
plot 'NoiseContrastCorrelation.csv' using 4:1 with points @pointStyle  notitle,\
	'' using 5:2 with points @pointStyle notitle,\
	'' using 6:3 with points @pointStyle  notitle,\
	.01 with points lt 1 @pointStyleKey t '\small$\sigma=17$',\
	.01 with points lt 2 @pointStyleKey t '\small$\sigma=51$',\
	.01 with points lt 3 @pointStyleKey t '\small$\sigma=85$'


	
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
	

set xrange [0:0.8]
set yrange [2:10]
set ylabel 'Entropy'
set xlabel 'Homogeneity'
unset logscale y
unset mytics 
set title '\textbf{GLCM Size}'
set ytics format "%g" 
 set xtics 0,0.15,.75
set lmargin at screen leftBuffer
set rmargin at screen leftBuffer + plotWidth
set label 1 '\Huge c' @POS
plot 'GLCMResEntropyHomogeneity.csv' using 6:1 with points @pointStyle  notitle,\
	'' using 7:2 with points @pointStyle notitle,\
	'' using 8:3 with points @pointStyle notitle,\
	'' using 9:4 with points @pointStyle notitle,\
	'' using 10:5 with points @pointStyle notitle,\
	.01 with points lt 1 @pointStyleKey t '\small$8\times8$',\
	.01 with points lt 2 @pointStyleKey t '\small$16\times16$',\
	.01 with points lt 3 @pointStyleKey t '\small$32\times32$',\
	.01 with points lt 4 @pointStyleKey t '\small$64\times64$',\
	.01 with points lt 5 @pointStyleKey t '\small$128\times128$'
	
set lmargin at screen leftBuffer + plotWidth + middleBuffer
set rmargin at screen leftBuffer + middleBuffer+ 2*plotWidth
unset ylabel
set ytics format "" 
set title '\textbf{Noise}'
set key
set label 1 '\Huge d' @POS
plot 'NoiseEntropyHomogeneity.csv' using 4:1 with points @pointStyle  notitle,\
	'' using 5:2 with points @pointStyle notitle,\
	'' using 6:3 with points @pointStyle  notitle,\
	.01 with points lt 1 @pointStyleKey t '\small$\sigma=17$',\
	.01 with points lt 2 @pointStyleKey t '\small$\sigma=51$',\
	.01 with points lt 3 @pointStyleKey t '\small$\sigma=85$'
	
	
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