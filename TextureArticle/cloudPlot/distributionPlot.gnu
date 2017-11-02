reset
set terminal epslatex standalone color size 18cm, 10cm font "cmr,8" 
set output 'distributionPlot.tex'
set datafile separator ","
set multiplot layout 2,3

texture = 'dissimilarity'

datas = "A B C D E";
do for [index = 1:words(datas)] {
	stats texture.'GLCMs.dat' using index name word(datas,index)
}

## Set significance marker style
pointStyle = 'with points ps 0.4 pt 7 lc rgb "#999999" notitle'
candlestickStyle = 'with candlesticks whiskerbars lc rgb "#000000" notitle'

set xtics 1
dx = 0.05
set boxwidth .05
## set logscale y
## set yrange [0:1]
set title 'GLCM'
set xrange [0:6]
set xtics ("8" 1, "16" 2, "32" 3, "64" 4, "128" 5)
plot texture.'GLCMs.dat' using (1-dx):1 @pointStyle,\
 '' using (1+dx):(A_mean-A_ssd):(A_min):(A_max):(A_mean+A_ssd) @candlestickStyle,\
 '' using (1+dx):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2-dx):2 @pointStyle,\
 '' using (2+dx):(B_mean-B_ssd):(B_min):(B_max):(B_mean+B_ssd) @candlestickStyle,\
 '' using (2+dx):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3-dx):3 @pointStyle,\
 '' using (3+dx):(C_mean-C_ssd):(C_min):(C_max):(C_mean+C_ssd) @candlestickStyle,\
 '' using (3+dx):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle,\
 '' using (4-dx):4 @pointStyle,\
 '' using (4+dx):(D_mean-D_ssd):(D_min):(D_max):(D_mean+D_ssd) @candlestickStyle,\
 '' using (4+dx):(D_mean):(D_mean):(D_mean):(D_mean) @candlestickStyle,\
 '' using (5-dx):5 @pointStyle,\
 '' using (5+dx):(E_mean-E_ssd):(E_min):(E_max):(E_mean+E_ssd) @candlestickStyle,\
 '' using (5+dx):(E_mean):(E_mean):(E_mean):(E_mean) @candlestickStyle
 
set xrange [0.5:3.5]
set xtics ("17" 1, "34" 2, "68" 3)
unset logscale y
set title 'Noise'
set xlabel '$\sigma$, A.u.'
datas = "A B C";
do for [index = 1:words(datas)] {
	stats texture.'Noise.dat' using index name word(datas,index)	
}
 plot texture.'Noise.dat' using (1-dx):1 @pointStyle,\
 '' using (1+dx):(A_mean-A_ssd):(A_min):(A_max):(A_mean+A_ssd) @candlestickStyle,\
 '' using (1+dx):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2-dx):2 @pointStyle,\
 '' using (2+dx):(B_mean-B_ssd):(B_min):(B_max):(B_mean+B_ssd) @candlestickStyle,\
 '' using (2+dx):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3-dx):3 @pointStyle,\
 '' using (3+dx):(C_mean-C_ssd):(C_min):(C_max):(C_mean+C_ssd) @candlestickStyle,\
 '' using (3+dx):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle


set title 'ADC' 
set xrange [0.5:4.5]
set xtics ('b: 200--1000' 1, 'b: 200--1000' 2, 'b: 200--1000' 3, 'b: 200--1000' 4) right rotate by 45
set xlabel 's/mm$^2$'
## set xtics rotate 10 
datas = "A B C D";
do for [index = 1:words(datas)] {
	stats texture.'ADC.dat' using index name word(datas,index)	
}
 
 plot texture.'ADC.dat' using (1-dx):1 @pointStyle,\
 '' using (1+dx):(A_mean-A_ssd):(A_min):(A_max):(A_mean+A_ssd) @candlestickStyle,\
 '' using (1+dx):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2-dx):2 @pointStyle,\
 '' using (2+dx):(B_mean-B_ssd):(B_min):(B_max):(B_mean+B_ssd) @candlestickStyle,\
 '' using (2+dx):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3-dx):3 @pointStyle,\
 '' using (3+dx):(C_mean-C_ssd):(C_min):(C_max):(C_mean+C_ssd) @candlestickStyle,\
 '' using (3+dx):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle,\
 '' using (4-dx):4 @pointStyle,\
 '' using (4+dx):(D_mean-D_ssd):(D_min):(D_max):(D_mean+D_ssd) @candlestickStyle,\
 '' using (4+dx):(D_mean):(D_mean):(D_mean):(D_mean) @candlestickStyle
 
set title 'Resolution'
set xrange [0.5:3.5]
set xtics ('1.2' 1, '1.8' 2, '3.6' 3) 
set xlabel 'mm'
datas = "A B C";
do for [index = 1:words(datas)] {
	stats texture.'Resolution.dat' using index name word(datas,index)	
}
 
 plot texture.'Resolution.dat' using (1-dx):1 @pointStyle,\
 '' using (1+dx):(A_mean-A_ssd):(A_min):(A_max):(A_mean+A_ssd) @candlestickStyle,\
 '' using (1+dx):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2-dx):2 @pointStyle,\
 '' using (2+dx):(B_mean-B_ssd):(B_min):(B_max):(B_mean+B_ssd) @candlestickStyle,\
 '' using (2+dx):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3-dx):3 @pointStyle,\
 '' using (3+dx):(C_mean-C_ssd):(C_min):(C_max):(C_mean+C_ssd) @candlestickStyle,\
 '' using (3+dx):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle
 
set title 'QuantMethod' 
set xrange [0.5:3.5]
set xtics ('AutoROI' 1, 'AutoSlice' 2, 'Manual' 3) right rotate by 45
unset xlabel
datas = "A B C";
do for [index = 1:words(datas)] {
	stats texture.'QuantMethod.dat' using index name word(datas,index)	
}
 
 plot texture.'QuantMethod.dat' using (1-dx):1 @pointStyle,\
 '' using (1+dx):(A_mean-A_ssd):(A_min):(A_max):(A_mean+A_ssd) @candlestickStyle,\
 '' using (1+dx):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2-dx):2 @pointStyle,\
 '' using (2+dx):(B_mean-B_ssd):(B_min):(B_max):(B_mean+B_ssd) @candlestickStyle,\
 '' using (2+dx):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3-dx):3 @pointStyle,\
 '' using (3+dx):(C_mean-C_ssd):(C_min):(C_max):(C_mean+C_ssd) @candlestickStyle,\
 '' using (3+dx):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle

	