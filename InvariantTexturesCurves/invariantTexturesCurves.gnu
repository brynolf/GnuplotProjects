reset
set terminal epslatex standalone color size 15cm, 9cm font "cmr,10" 
set output 'invariantTexturesCurves.tex'
set datafile separator ","
set logscale y

set multiplot 

load 'moreland.pal'
## load 'ylorrd.pal'

## Set macros
set macros

## Define positions of the graphs
load 'positions.gnu'

## Plot first graph
set lmargin at screen lBuffer
set rmargin at screen lBuffer + graphWidth
unset colorbox 
plot 'invariantFeaturesFrontalCortex.csv' using 1:2 with lines ls 1 notitle,\
	'' using 1:3 with lines ls 2 notitle,\
	'' using 1:4 with lines notitle,\
	'' using 1:5 with lines notitle
	
## Plot Second graph
set lmargin at screen lBuffer + graphWidth + mBuffer
set rmargin at screen lBuffer + 2*graphWidth + mBuffer
plot 'featuresFrontalCortex.csv' using 1:2 with lines dt 2 notitle,\
	'' using 1:3 with lines dt 2 notitle,\
	'' using 1:4 with lines dt 2 notitle,\
	'' using 1:5 with lines dt 2 notitle