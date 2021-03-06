reset
set terminal epslatex standalone color size 11cm, 9cm header \
"\\usepackage[bitstream-charter]{mathdesign}"
set output 'heatmaps2x2.tex'

## Set multiplot
set multiplot 

## load 'rdgy.pal'

## set palette defined ( 0 '#0a00ff',\
    	    	      ## 1 '#00ffff',\
		      ## 2 '#00ff0eff',\
		      ## 3 '#f8ff00ff',\
		      ## 4 '#ff8e00ff',\
		      ## 5 '#ff0500ff')
set datafile separator ","
## Define positions of the graphs
load 'positions2Graphs.gnu'

## Set macros
set macros
set ytics format "10$^{%0.1L}$" 
set mytics 10
pointStyle = 'pt 6 notitle'
load 'origXYTics.gnu'

########################## HEAT MAPS #############################
unset y2tics
set ytics mirror
unset mytics
unset my2tics
load 'paletteBrain.pal'
## load 'ylorrd.pal'
unset logscale y
unset logscale y2
unset label 1
unset label 2
unset label 3
unset label 4

## Set range of colorbar
set cbrange [0.4132:1]
## set cbrange [0.4:1]

## Set ranges
set xrange [ -0.5 : 31.5 ] reverse nowriteback
set yrange [ 31.5 : -0.5 ] reverse 

set label 5 'Classifiers trained on one quantization' at screen 0.245,0.965

## Plot first heatmap
set title '\scriptsize{Original Features}' offset 0,-.7
## unset xtics
set xtics (0,3,7,11,15,19,23,27,31) format " "
set tics front
unset ylabel
set ylabel '\small{MRI Brain region dataset}' offset 0.8,0.5
set label 1 '\scriptsize{Test dataset gray levels}' at screen 0.065,0.54 rotate by 90
set lmargin at screen leftMargin
set rmargin at screen leftMargin + heatmapWidth
set tmargin at screen bottomMargin + 2*heatmapHeight + midVertHeatmapMargin
set bmargin at screen bottomMargin + heatmapHeight + midVertHeatmapMargin
unset xlabel
unset colorbox 
load 'heatmapAxesLabels2x2Y.gnu'
plot 'origDataBrainAll.csv'  matrix  with image pixels notitle

## Plot Colorbar
load 'heatmapAxesLabelsCBBrain.gnu'
set colorbox user size cbWidth,heatmapHeight origin screen cbPosition,bottomMargin + heatmapHeight + midVertHeatmapMargin

## Plot Second heatmap
## Define positions of the graphs
set title '\scriptsize{Invariant Features}' offset 0,-.7
unset label 1
unset label 5
## set title 'Classification success' offset 0,-.5
unset ylabel  
unset xlabel
set ytics (0,4,8,12,16,20,24,28,31) format " "
set lmargin at screen leftMargin + heatmapWidth + midHorizHeatmapMargin
set rmargin at screen leftMargin + 2*heatmapWidth + midHorizHeatmapMargin
plot 'invDataBrainAll.csv' matrix with image pixels notitle

## Set range of colorbar
load 'paletteGland.pal'
set cbrange [0.58:.8]	

## Plot Third heatmap
unset title
load 'heatmapAxesLabels2x2X.gnu'
load 'heatmapAxesLabels2x2Y.gnu'
set ylabel '\small{H\&E stained gland dataset}' offset 0.8,-.8
set label 1 '\scriptsize{Test dataset gray levels}' at screen 0.065,0.125 rotate by 90
set xlabel '\scriptsize{Training dataset gray levels}' offset 0,.8
set lmargin at screen leftMargin
set rmargin at screen leftMargin + heatmapWidth
set tmargin at screen heatmapHeight+bottomMargin
set bmargin at screen bottomMargin
unset colorbox 
plot 'origDataCell.csv'  matrix  with image pixels notitle

## Plot Colorbar
load 'heatmapAxesLabelsCBGland.gnu'
set colorbox user size cbWidth,heatmapHeight origin screen cbPosition,bottomMargin

## Plot Fourth heatmap
## Define positions of the graphs
unset ylabel  
set lmargin at screen leftMargin + heatmapWidth + midHorizHeatmapMargin
set rmargin at screen leftMargin + 2*heatmapWidth + midHorizHeatmapMargin
unset ylabel
set ytics (0,4,8,12,16,20,24,28,31) format " "
plot 'invDataCell.csv' matrix with image pixels notitle