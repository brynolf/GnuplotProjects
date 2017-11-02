reset
set terminal epslatex standalone color size 8cm, 6cm font "cmr,9" 
set output 'quantization.tex'

set multiplot layout 1,2

leftSpacing  	= 0.2
midSpacing 		= 0.02
rightSpacing    = 0.01
canvasWidth  	= (1-(leftSpacing +midSpacing+rightSpacing))/2

minPos = 1
maxPos = 1.9
rangePos = 3.5

candlestickStyle = 'with candlesticks whiskerbars lc rgb "#000000" notitle'
## set yrange [-500:3800]
## set xrange [0.5:2.5]
set xtics ('Min' minPos, 'Max' maxPos, 'Range' rangePos) nomirror
set ytics 0,1000, 3000
set ylabel 'ADC [mm$^2/$s]'
set boxwidth 0.4 

dataFiles = 'gliomaData.dat prostateData.dat'
titles = '"High grade glioma" "Prostate cancer"'

do for [df = 1:2] {
	dataFile = word(dataFiles,df)
	unset yrange
	unset xrange
	stats dataFile using 1 name 'min'
	stats dataFile using 2 name 'max'
	stats dataFile using 3 name 'range'
	set yrange [-200:3800]
	set xrange [0.5:4]
	
	if (df > 1) {
		unset ylabel
		set ytics format ''
	}
	
	set lmargin at screen leftSpacing + (df-1)*(canvasWidth+midSpacing)
	set rmargin at screen leftSpacing + (df)*(canvasWidth)
	
	set title word(titles,df)
	## plot dataFile using (1):(STATS_lo_quartile_x):(STATS_min_x):(STATS_max_x):(STATS_up_quartile_x) @candlestickStyle,\
	## '' using (1):(STATS_median_x):(STATS_median_x):(STATS_median_x):(STATS_median_x) @candlestickStyle,\
	## '' using (2):(STATS_lo_quartile_y):(STATS_min_y):(STATS_max_y):(STATS_up_quartile_y) @candlestickStyle,\
	## '' using (2):(STATS_median_y):(STATS_median_y):(STATS_median_y):(STATS_median_y) @candlestickStyle
	
	plot dataFile using (minPos):(min_lo_quartile):(min_min):(min_max):(min_up_quartile) @candlestickStyle,\
 '' using (minPos):(min_mean):(min_mean):(min_mean):(min_mean) @candlestickStyle,\
 '' using (maxPos):(max_lo_quartile):(max_min):(max_max):(max_up_quartile) @candlestickStyle,\
 '' using (maxPos):(max_mean):(max_mean):(max_mean):(max_mean) @candlestickStyle,\
 '' using (rangePos):(range_lo_quartile):(range_min):(range_max):(range_up_quartile) @candlestickStyle,\
 '' using (rangePos):(range_mean):(range_mean):(range_mean):(range_mean) @candlestickStyle
}
