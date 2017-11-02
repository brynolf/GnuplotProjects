reset
set terminal epslatex standalone color size 9cm, 6.3cm header \
"\\usepackage[bitstream-charter]{mathdesign}"
set output 'heatmapRatio.tex'

## Set multiplot
## set multiplot 

## Load moreland.pal
load 'moreland.pal'
set datafile separator ","

## Set macros
set macros

## Set raneg of colorbar
set cbrange [.5:2] 
set logscale cb

## Set ranges
set xrange [ -0.5 : 15.5 ] reverse nowriteback
set yrange [ 15.5 : -0.5 ] reverse 

## Load x- and y-labels
## load 'axesLabels.gnu'

## Define positions of the graphs
load 'positions2.gnu'
load 'heatmapAxesLabels.gnu'


## Plot first graph
set title '\Large Invariant/Original'
set ylabel '\textbf{Test data set gray levels}' offset 2,0
set xlabel '\textbf{Training data set gray levels}' offset -.7,.6
set lmargin at screen legendWidth
set rmargin at screen legendWidth + graphWidth
set tmargin at screen graphHeight+bBuffer
set bmargin at screen bBuffer
set colorbox user size cbWidth,graphHeight origin screen legendWidth + graphWidth + cbBuffer , bBuffer
set cbtics ("0.5" 0.5, "0.72" 0.72, "1.0" 1, "1.5" 1.333,"2" 2)
set mcbtics 1
## unset colorbox 
plot 'ratio.csv'  matrix  with image pixels notitle

## Plot Second graph
## Define positions of the graphs
## set title '\Large Invariant features'
## unset ylabel  
## set xlabel '\textbf{Training dataset gray levels}' offset .7,.6
## set lmargin at screen legendWidth + graphWidth + buffer
## set ytics 1 scale 0
## set ytics format " " 
## set colorbox user size cbWidth,graphHeight origin screen legendWidth + graphWidth + graphWidth + buffer + cbBuffer, bBuffer
## set rmargin at screen legendWidth + graphWidth + graphWidth + buffer 
## plot 'res_inv_transposed.csv' matrix with image pixels notitle