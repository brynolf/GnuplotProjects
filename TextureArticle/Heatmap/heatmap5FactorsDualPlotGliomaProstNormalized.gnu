reset
set terminal epslatex standalone color size 15cm, 15cm font "cmr,8" 
set output 'heatmap5FactorsDualPlotGliomaProstNormalized.tex'

## Set range of colorbar
set cbrange [-.7:.7]

## set logscale cb
set multiplot 

## Set ranges
set xrange [ -0.5 : 18.5 ] noreverse nowriteback
set yrange [ 48.5 : -0.5 ] noreverse 

## Set macros
set macros

## Load moreland.pal
load 'moreland.pal'
set datafile separator ","

## Load x- and y-labels
load 'axesLabels.gnu'

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
lineHeight = 0.015767
tinyBuffer = 0.0012

graphWidth = (1-legendWidth-buffer - colorspace )/2
set bmargin at screen 0.17

## Set significance marker style
pointStyle = 'with points ps 0.4 pt 7 lc rgb "#000000" notitle'


## Plot Glioma graph
set ytics nomirror
set title '(a) MLR coefficients, glioma'
set lmargin at screen legendWidth
set rmargin at screen legendWidth + graphWidth
unset colorbox 
plot 'heatmap_MLRcoefficientsGliomaNormalized.bin' binary array=(19,49) format='%double' rotate=pi transpose flip=xy with image notitle,\
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
	'significant_MLRcoefficientsGliomaNormalized.dat' @pointStyle


## load 'unsetArrows.gnu'
# Unset ticks
set ytics 1 scale 0
set ytics format " " 
	
## Plot First section of prost graph
set title '(b) MLR coefficients, prostate'
set lmargin at screen legendWidth + graphWidth + buffer
set rmargin at screen legendWidth + 2*graphWidth + buffer 

set colorbox size 0.05,0.5
plot 'heatmap_MLRcoefficientsProstNormalized_Prost_Block1.bin' binary array=(19,3) format='%double' rotate=pi transpose flip=xy with image notitle,\
	2.5 with lines dt 3 lt rgb "#000000" notitle,\
	'significant_MLRcoefficientsProstNormalized_Prost_Block1.dat' @pointStyle
	
## Plot second section of prost graph
set xtics 1 scale 0
set xtics format " "
unset title 
unset border
## Set ranges
set xrange [ -0.5 : 18.5 ] noreverse nowriteback
set yrange [ 7.5 : -0.5 ] noreverse 

pos = 0.706666

unset colorbox
set lmargin at screen legendWidth + graphWidth + buffer + tinyBuffer
set rmargin at screen legendWidth + 2*graphWidth + buffer - tinyBuffer
set tmargin at screen pos + lineHeight*8
set bmargin at screen pos

plot 'heatmap_MLRcoefficientsProstNormalized_Prost_Block2.bin' binary array=(19,8) format='%double' rotate=pi transpose flip=xy with image notitle,\
	-.5 with lines dt 3 lt rgb "#000000" notitle,\
	2.5 with lines dt 3 lt rgb "#000000" notitle,\
	5.5 with lines dt 3 lt rgb "#000000" notitle,\
	7.5 with lines dt 3 lt rgb "#000000" notitle,\
	'significant_MLRcoefficientsProstNormalized_Prost_Block2.dat' @pointStyle
	
	
## Plot third section of prost graph
## Set ranges
set xrange [ -0.5 : 18.5 ] noreverse nowriteback
set yrange [ 3.5 : -0.5 ] noreverse 

pos2 = 0.58053
set tmargin at screen pos2 + lineHeight*4
set bmargin at screen pos2

plot 'heatmap_MLRcoefficientsProstNormalized_Prost_Block3.bin' binary array=(19,4) format='%double' rotate=pi transpose flip=xy with image notitle,\
	-.5 with lines dt 3 lt rgb "#000000" notitle,\
	2.5 with lines dt 3 lt rgb "#000000" notitle,\
	3.5 with lines dt 3 lt rgb "#000000" notitle,\
	'significant_MLRcoefficientsProstNormalized_Prost_Block3.dat' @pointStyle

## Plot fourth section of prost graph
## Set ranges
set xrange [ -0.5 : 18.5 ] noreverse nowriteback
set yrange [ 2.5 : -0.5 ] noreverse 

pos2 = 0.470161
set tmargin at screen pos2 + lineHeight*3
set bmargin at screen pos2

plot 'heatmap_MLRcoefficientsProstNormalized_Prost_Block4.bin' binary array=(19,3) format='%double' rotate=pi transpose flip=xy with image notitle,\
	-.5 with lines dt 3 lt rgb "#000000" notitle,\
	2.5 with lines dt 3 lt rgb "#000000" notitle,\
	'significant_MLRcoefficientsProstNormalized_Prost_Block4.dat' @pointStyle

## Plot fifth section of prost graph
## Set ranges
set xrange [ -0.5 : 18.5 ] noreverse nowriteback
set yrange [ 2.5 : -0.5 ] noreverse 

pos2 = 0.359792
set tmargin at screen pos2 + lineHeight*3
set bmargin at screen pos2

plot 'heatmap_MLRcoefficientsProstNormalized_Prost_Block5.bin' binary array=(19,3) format='%double' rotate=pi transpose flip=xy with image notitle,\
	-.5 with lines dt 3 lt rgb "#000000" notitle,\
	2.5 with lines dt 3 lt rgb "#000000" notitle,\
	'significant_MLRcoefficientsProstNormalized_Prost_Block5.dat' @pointStyle
