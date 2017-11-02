reset
set terminal epslatex standalone color size 15cm, 9cm font "cmr,10" 
set output 'heatmaps.tex'

## Set multiplot
set multiplot 

## Load moreland.pal
load 'ylorrd.pal'
set datafile separator ","

## Set macros
set macros

## Set raneg of colorbar
set cbrange [.5:1]

## Set ranges
set xrange [ -0.5 : 15.5 ] noreverse nowriteback
set yrange [ 15.5 : -0.5 ] noreverse 

## Load x- and y-labels
load 'axesLabels.gnu'

## Define positions of the graphs
load 'positions.gnu'


## Plot first graph
set title 'Original features'
set ylabel 'Training dataset gray levels' offset 1,0
set xlabel 'Test dataset gray levels' 
set lmargin at screen legendWidth
set rmargin at screen legendWidth + graphWidth
unset colorbox 
plot 'res_orig.csv' matrix with image notitle

## Plot Second graph
## Define positions of the graphs
set title 'Invariant features'
unset ylabel  
set xlabel 'Test dataset gray levels' 
set lmargin at screen legendWidth + graphWidth + buffer
set ytics 1 scale 0
set ytics format " " 
set colorbox user size 0.02,top-bottom origin screen legendWidth + graphWidth + graphWidth + buffer + cbBuffer, bottom
set rmargin at screen legendWidth + graphWidth + graphWidth + buffer 
plot 'res_inv.csv' matrix with image notitle