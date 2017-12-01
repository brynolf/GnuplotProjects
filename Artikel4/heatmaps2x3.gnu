reset
set terminal epslatex standalone color size 12.75cm, 17cm header \
"\\usepackage[bitstream-charter]{mathdesign}"
set output 'heatmaps2x2.tex'

## Set multiplot
set multiplot 

load 'rdgy.pal'

## set palette defined ( 0 '#0a00ff',\
    	    	      ## 1 '#00ffff',\
		      ## 2 '#00ff0eff',\
		      ## 3 '#f8ff00ff',\
		      ## 4 '#ff8e00ff',\
		      ## 5 '#ff0500ff')
set datafile separator ","
## Define positions of the graphs
load 'positions3Graphs.gnu'

## Set macros
set macros
set ytics format "10$^{%0.1L}$" 
set mytics 10
pointStyle = 'pt 6 notitle'
load 'origXYTics.gnu'

# Plot first graph
set title 'Original features' offset 0,-.5
set xrange [0:260]
set logscale y
set xlabel '\footnotesize{Image quantization gray levels}' offset 0,1
set ylabel '\footnotesize{Texture Feature values}' offset 1.2,0
set lmargin at screen leftMargin
set rmargin at screen leftMargin + graphWidth
set tmargin at screen 1-topMargin
set bmargin at screen 1-topMargin-graphHeight
set label 1 'Cluster Shade' at graph 0.4,0.54 rotate by 8
set label 2 'Correlation' at first 64,5 rotate by 0
set label 3 'Energy' at 96,0.007 rotate by -5
set label 4 'Cluster Prominence' at graph 0.2,0.8 rotate by 11

plot 'origCellDataForPlotting.csv' using 1:2 with linespoints ls 1 @pointStyle,\
	'' using 1:3 with linespoints ls 3 @pointStyle,\
	'' using 1:4 with linespoints lc rgb "#333333" @pointStyle,\
	'' using 1:5 with linespoints ls 7 @pointStyle,\
	'' using 1:6 with linespoints ls 9 @pointStyle
	
# Plot second graph
unset ylabel
set title 'Renormalized features'
set xrange [0:260]
set y2range [5e-3:1e2]
unset ytics
set y2tics mirror
set y2tics format "10$^{%0.1L}$" 
set logscale y2
set my2tics 10
set lmargin at screen leftMargin + graphWidth + midGraphMargin
set rmargin at screen leftMargin + 2*graphWidth + midGraphMargin
set tmargin at screen 1-topMargin
set bmargin at screen 1-topMargin-graphHeight
set label 1 'Cluster Shade' at 64,1.2e-2 rotate by 0 
set label 2 'Correlation' at first 64,1.5 rotate by 0
set label 3 'Energy' at 64,23 rotate by 0
set label 4 'Cluster Prominence' at 64,7e-2 rotate by 0
plot 'invCellDataForPlotting.csv' using 1:2 with linespoints ls 1 @pointStyle axes x1y2,\
	'' using 1:3 with linespoints ls 3 @pointStyle axes x1y2,\
	'' using 1:4 with linespoints lc rgb "#333333" @pointStyle axes x1y2,\
	'' using 1:5 with linespoints ls 7 @pointStyle axes x1y2,\
	'' using 1:6 with linespoints ls 9 @pointStyle axes x1y2




## Load x- and y-labels
## load 'axesLabels.gnu'

########################## HEAT MAPS #############################
unset y2tics
set ytics mirror
unset mytics
unset my2tics
## Load moreland.pal
load 'ylorrd.pal'
unset logscale y
unset logscale y2
unset label 1
unset label 2
unset label 3
unset label 4

## Set range of colorbar
set cbrange [.5:1]

## Set ranges
set xrange [ -0.5 : 31.5 ] reverse nowriteback
set yrange [ 31.5 : -0.5 ] reverse 

## Plot first heatmap
set title 'Classification accuracy' offset 11,-.5
## unset xtics
set xtics (0,3,7,11,15,19,23,27,31) format " "
set tics front
unset ylabel
set ylabel '\small{MRI Brain region dataset}' offset 0.8,0
set label 1 '\scriptsize{Test dataset gray levels}' at screen 0.075,0.4 rotate by 90
set lmargin at screen leftMargin
set rmargin at screen leftMargin + heatmapWidth
set tmargin at screen bottomMargin + 2*heatmapHeight + midVertHeatmapMargin
set bmargin at screen bottomMargin + heatmapHeight + midVertHeatmapMargin
unset xlabel
unset colorbox 
load 'heatmapAxesLabels2x2Y.gnu'
plot 'origDataBrainAll.csv'  matrix  with image pixels notitle

## Plot Second heatmap
## Define positions of the graphs
unset title
unset label 1
## set title 'Classification success' offset 0,-.5
unset ylabel  
unset xlabel
set ytics (0,4,8,12,16,20,24,28,31) format " "
set lmargin at screen leftMargin + heatmapWidth + midHorizHeatmapMargin
set rmargin at screen leftMargin + 2*heatmapWidth + midHorizHeatmapMargin
plot 'invDataBrainAll.csv' matrix with image pixels notitle
	
## Plot Third heatmap
unset title
load 'heatmapAxesLabels2x2X.gnu'
load 'heatmapAxesLabels2x2Y.gnu'
set ylabel '\small{H\&E stained gland dataset}' offset 0.8,0
set label 1 '\scriptsize{Test dataset gray levels}' at screen 0.075,0.12 rotate by 90
set xlabel '\scriptsize{Training dataset gray levels}' offset 0,.2
set lmargin at screen leftMargin
set rmargin at screen leftMargin + heatmapWidth
set tmargin at screen heatmapHeight+bottomMargin
set bmargin at screen bottomMargin
unset colorbox 
plot 'origDataCell.csv'  matrix  with image pixels notitle

## Plot Fourth heatmap
## Define positions of the graphs
unset ylabel  
set lmargin at screen leftMargin + heatmapWidth + midHorizHeatmapMargin
set rmargin at screen leftMargin + 2*heatmapWidth + midHorizHeatmapMargin
unset ylabel
set ytics (0,4,8,12,16,20,24,28,31) format " "
load 'heatmapAxesLabelsCB.gnu'
set colorbox user size cbWidth,2*heatmapHeight+midVertHeatmapMargin origin screen cbPosition,bottomMargin
plot 'invDataCell.csv' matrix with image pixels notitle
