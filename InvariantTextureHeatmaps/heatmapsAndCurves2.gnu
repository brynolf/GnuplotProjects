reset
set terminal epslatex standalone color size 15cm, 15cm font "cmr,8" 
set output 'heatmapsAndCurves2.tex'

## Set multiplot
set multiplot 

## Load moreland.pal
load 'ylorrd.pal'
set datafile separator ","

## Set macros
set macros

## Set raneg of colorbar
set cbrange [.5:1]

## Define positions of the graphs
load 'positions.gnu'

## Line styles
load 'linestyles.gnu'

## Plot first curve
load 'curvesAxesLabels.gnu'
set title '\huge{Original features values}' offset 0,-0.7
set xlabel '\Large{Gray levels (N)}'
set lmargin at screen legendWidth
set rmargin at screen legendWidth + graphWidth
set tmargin at screen bBuffer + 2*graphHeight + mBuffer
set bmargin at screen bBuffer + graphHeight + mBuffer
unset label
set label '\huge{a}' at graph 0.1,0.1
plot 'featuresFrontalCortex128.csv' using 1:2 with lines ls 1 notitle,\
	'' using 1:3 with lines ls 2 notitle,\
	'' using 1:4 with lines ls 3 notitle,\
	'' using 1:5 with lines ls 4 notitle

## Plot second curve
load 'curvesAxesLabels.gnu'
unset ytics
unset my2tics
set yrange [1e-4:1e5]
set y2tics format '\large{10$^{%T}$}' mirror
set title '\huge{Invariant features values}' 
set lmargin at screen legendWidth + graphWidth + buffer
set rmargin at screen legendWidth + graphWidth + graphWidth + buffer 
set tmargin at screen bBuffer + 2*graphHeight + mBuffer
set bmargin at screen bBuffer + graphHeight + mBuffer
set key Left reverse left at graph 0.35,0.95 width -0.2 height 1 autotitle columnhead box 
unset label
set label '\huge{b}' at graph 0.1,0.1
plot 'invariantFeaturesFrontalCortex128.csv' using 1:2 with lines ls 1,\
	'' using 1:3 with lines ls 2,\
	'' using 1:4 with lines ls 3,\
	'' using 1:5 with lines ls 4
	
## Plot first heatmap
load 'heatmapAxesLabels.gnu'
set title '\Large{Tissue classification, original features}'
set ylabel '\large{Training dataset gray levels (N)}' offset 1,0
set xlabel '\Large{Test dataset gray levels (N)}' offset 0,0
set lmargin at screen legendWidth
set rmargin at screen legendWidth + graphWidth
set tmargin at screen bBuffer + graphHeight
set bmargin at screen bBuffer

unset colorbox 
unset label
set label '\huge{c}' at graph 0.1,0.1 front
plot 'res_orig.csv' matrix with image notitle	

## Plot Second heatmap
load 'heatmapAxesLabels.gnu'
set title '\Large{Tissue classification, invariant features}' offset 1,-0.7
## Define positions of the graphs
unset ylabel  
set xlabel '\Large{Test dataset gray levels (N)}' offset 0,0
set lmargin at screen legendWidth + graphWidth + buffer
set rmargin at screen legendWidth + graphWidth + graphWidth + buffer 
set tmargin at screen bBuffer + graphHeight
set bmargin at screen bBuffer
set ytics 1 scale 0
set ytics format " " 
set colorbox user size 0.02,graphHeight origin screen legendWidth + graphWidth + graphWidth + buffer + cbBuffer, bBuffer
unset label
set label '\huge{d}' at graph 0.1,0.1 front
plot 'res_inv.csv' matrix with image notitle