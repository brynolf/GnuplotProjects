reset
set terminal epslatex standalone color size 12cm, 12cm font "cmr,8" 
set output 'heatmapDualPlotAnova.tex'
set multiplot layout 1,2

load 'paletteDetails.gnu'

## Set ranges
set yrange [ 18.5: -0.5 ] noreverse nowriteback
set xrange [ -0.5 : 4.5 ] noreverse 

## Set macros
set macros

## Load moreland.pal
load 'ylorrd.pal'
set datafile separator ","

## Load x- and y-labels
load 'ticks.gnu'

## Load rectangles
## load 'rectangles.gnu'

# Set x- and y-tics outside
set tics front scale 1 out
# Set colorbox tics inside
set cbtics in

## Define positions of the graphs
load 'positions.gnu'

## Set significance marker style
pointStyle = 'with points ps 0.4 pt 7 lc rgb "#000000" notitle'


## Plot first graph
set ytics nomirror
set title '(a) p-values, Glioma'
set lmargin at screen legendWidth
set rmargin at screen legendWidth + graphWidth1
unset colorbox 
plot 'heatmapAnova_TextureResults.bin' binary array=(5,19) format='%double' rotate=pi transpose flip=xy with image notitle,\
'significantAnova_TextureResults.dat' @pointStyle

	
## Plot Second graph
set xrange [ -0.5 : 3.5 ] noreverse 
unset arrow 1
unset arrow 2
set title '(b) p-values, prostate'
set lmargin at screen legendWidth + graphWidth1 + buffer
set rmargin at screen legendWidth + graphWidth1 + graphWidth2 + buffer 

set ytics 1 scale 0
set ytics format " " 
set colorbox user size 0.02,top-bottom origin screen legendWidth + graphWidth1 + graphWidth2 + buffer + cbBuffer, 0.17
plot 'heatmapAnova_TextureResultsProstate.bin' binary array=(4,19) format='%double' rotate=pi transpose flip=xy with image notitle,\
'significantAnova_TextureResultsProstate.dat' @pointStyle