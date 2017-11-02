reset
set terminal epslatex standalone color size 4cm, 4cm font "cmr,9" 
set output 'quantizationGlioma.tex'

dataFile = 'gliomaData.dat'
candlestickStyle = 'with candlesticks whiskerbars lc rgb "#000000" notitle'

stats dataFile

set yrange [-500:3800]
set xrange [0.5:2.5]
set xtics ('min' 1, 'max' 2)
set ytics 0,1000, 3000
set ylabel 'ADC [mm$^2/$s]'
set boxwidth 0.4 

plot dataFile using (1):(STATS_lo_quartile_x):(STATS_min_x):(STATS_max_x):(STATS_up_quartile_x) @candlestickStyle,\
 '' using (1):(STATS_median_x):(STATS_median_x):(STATS_median_x):(STATS_median_x) @candlestickStyle,\
 '' using (2):(STATS_lo_quartile_y):(STATS_min_y):(STATS_max_y):(STATS_up_quartile_y) @candlestickStyle,\
 '' using (2):(STATS_median_y):(STATS_median_y):(STATS_median_y):(STATS_median_y) @candlestickStyle