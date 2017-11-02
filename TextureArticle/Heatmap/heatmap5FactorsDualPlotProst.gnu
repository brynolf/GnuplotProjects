reset
set terminal epslatex standalone color size 15cm, 12cm font "cmr,8" 
set output 'heatmap5FactorsDualPlotProst.tex'

## Set range of colorbar
set cbrange [-.7:.7]

## set logscale cb
set multiplot layout 1,2

## Set ranges
set xrange [ -0.5 : 18.5 ] noreverse nowriteback
set yrange [ 20.5 : -0.5 ] noreverse 

## Set macros
set macros

## Load moreland.pal
load 'moreland.pal'
set datafile separator ","

## Load x- and y-labels
load 'axesLabelsProst.gnu'

## Load rectangles
## load 'rectangles.gnu'

# Set x- and y-tics outside
set tics front scale 1 out
# Set colorbox tics inside
set cbtics in

## Define positions of the graphs
legendWidth = 0.353
buffer = 0.02
colorspace  = 0.08
graphWidth = (1-legendWidth-buffer - colorspace )/2
set bmargin at screen 0.17

## Set significance marker style
pointStyle = 'with points ps 0.4 pt 7 lc rgb "#000000" notitle'


## Plot first graph
set ytics nomirror
set title '(a) PLS coefficients'
set lmargin at screen legendWidth
set rmargin at screen legendWidth + graphWidth
unset colorbox 
plot 'heatmap_PLS_Prost.bin' binary array=(19,21) format='%double' rotate=pi transpose flip=xy with image notitle,\
	2.5 with lines dt 3 lt rgb "#000000" notitle,\
	6.5 with lines dt 3 lt rgb "#000000" notitle,\
	9.5 with lines dt 3 lt rgb "#000000" notitle,\
	12.5 with lines dt 3 lt rgb "#000000" notitle,\
	14.5 with lines dt 3 lt rgb "#000000" notitle,\
	18.5 with lines dt 3 lt rgb "#000000" notitle,\
	21.5 with lines dt 3 lt rgb "#000000" notitle,\
	22.5 with lines dt 3 lt rgb "#000000" notitle,\
	26.5 with lines dt 3 lt rgb "#000000" notitle,\
	29.5 with lines dt 3 lt rgb "#000000" notitle,\
	33.5 with lines dt 3 lt rgb "#000000" notitle,\
	36.5 with lines dt 3 lt rgb "#000000" notitle,\
	'significant_PLS_Prost.dat' @pointStyle

	
## Plot Second graph
unset arrow 1
unset arrow 2
set title '(b) MLR coefficients'
set lmargin at screen legendWidth + graphWidth + buffer
set rmargin at screen legendWidth + 2*graphWidth + buffer 

set ytics 1 scale 0
set ytics format " " 
set colorbox size 0.05,0.5
plot 'heatmap_MLR_Prost.bin' binary array=(19,21) format='%double' rotate=pi transpose flip=xy with image notitle,\
	2.5 with lines dt 3 lt rgb "#000000" notitle,\
	6.5 with lines dt 3 lt rgb "#000000" notitle,\
	9.5 with lines dt 3 lt rgb "#000000" notitle,\
	12.5 with lines dt 3 lt rgb "#000000" notitle,\
	14.5 with lines dt 3 lt rgb "#000000" notitle,\
	18.5 with lines dt 3 lt rgb "#000000" notitle,\
	21.5 with lines dt 3 lt rgb "#000000" notitle,\
	22.5 with lines dt 3 lt rgb "#000000" notitle,\
	26.5 with lines dt 3 lt rgb "#000000" notitle,\
	29.5 with lines dt 3 lt rgb "#000000" notitle,\
	33.5 with lines dt 3 lt rgb "#000000" notitle,\
	36.5 with lines dt 3 lt rgb "#000000" notitle,\
	'significant_MLR_Prost.dat' @pointStyle