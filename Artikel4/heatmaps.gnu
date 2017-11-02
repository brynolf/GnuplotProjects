reset
set terminal epslatex standalone color size 13cm, 6.3cm header \
"\\usepackage[bitstream-charter]{mathdesign}"
set output 'heatmaps.tex'

## Set multiplot
set multiplot 

## Load moreland.pal
load 'ylorrd.pal'
## load 'ylrd.pal'

## set palette defined ( 0 '#0a00ff',\
    	    	      ## 1 '#00ffff',\
		      ## 2 '#00ff0eff',\
		      ## 3 '#f8ff00ff',\
		      ## 4 '#ff8e00ff',\
		      ## 5 '#ff0500ff')
## set datafile separator ","

## Set macros
set macros

## Set raneg of colorbar
set cbrange [.5:1]

## Set ranges
set xrange [ -0.5 : 15.5 ] reverse nowriteback
set yrange [ 15.5 : -0.5 ] reverse 

pointStyle = 'with points ps 0.4 pt 7 lc rgb "#000000" notitle'
## Load x- and y-labels
## load 'axesLabels.gnu'

## Define positions of the graphs
load 'positions.gnu'
load 'heatmapAxesLabels.gnu'


## Plot first graph
set title '\Large Original features'
set ylabel '{Test data set gray levels}' offset 2,0
set xlabel '{Training data set gray levels}' offset 0,.3
set lmargin at screen legendWidth
set rmargin at screen legendWidth + graphWidth
set tmargin at screen graphHeight+bBuffer
set bmargin at screen bBuffer
unset colorbox 
plot 'res_orig_transposed.csv'  matrix  with image pixels notitle,\
	'significane_orig_transposed.dat' @pointStyle

## Plot Second graph
## Define positions of the graphs
set title '\Large Invariant features'
unset ylabel  
set xlabel '{Training data set gray levels}' offset 0,.3
set lmargin at screen legendWidth + graphWidth + buffer
set ytics 1 scale 0
set ytics format " " 
set colorbox user size cbWidth,graphHeight origin screen legendWidth + graphWidth + graphWidth + buffer + cbBuffer, bBuffer
set rmargin at screen legendWidth + graphWidth + graphWidth + buffer 
plot 'res_inv_transposed.csv' matrix with image pixels notitle,\
	'significane_inv_transposed.dat' @pointStyle