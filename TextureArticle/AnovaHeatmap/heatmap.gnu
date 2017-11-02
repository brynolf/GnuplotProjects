reset
set terminal epslatex standalone color size 7cm, 10cm font "cmr,8" 
set output 'heatmap.tex'

## Set raneg of colorbar
## set cbrange [0:.05/475]

## set logscale cb

					  
set yrange [ 18.5: -0.5 ] noreverse nowriteback
set xrange [ -0.5 : 4.5 ] noreverse 


load 'moreland.pal'


## Load x- and y-labels
load 'ticks.gnu'


set tics front
set title 'MLR coefficients'



set colorbox size 0.05,0.5

plot 'heatmapKS_NormalizedTextureResults.bin' binary array=(5,19) format='%double' rotate=pi transpose flip=xy with image notitle