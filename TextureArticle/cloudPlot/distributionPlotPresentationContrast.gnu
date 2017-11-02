reset
set terminal epslatex standalone color size 18cm, 10cm font "cmr,8" 
set output 'distributionPlotPresentationContrast.tex'
set datafile separator ","
set multiplot layout 2,3

texture = 'Contrast'

leftSpacing  	= 0.1
horizSpacing 	= 0.02
vertTopSpacing  = 0.02
vertMidSpacing  = 0.1
vertBotSpacing  = 0.1
canvasWidth  	= (1-(leftSpacing +3*horizSpacing))/3
canvasHeight 	= (1-vertTopSpacing-vertMidSpacing-vertBotSpacing)/2

## Set significance marker style
candlestickStyle = 'with candlesticks whiskerbars lc rgb "#000000" notitle'
set yrange [0:200]
file = texture.'Resolution.dat'
set boxwidth .1 
set title 'Resolution' offset 0,-3
set xrange [0.5:3.5] 
unset xtics
set xtics ('1.2' 1, '1.8' 2, '3.6' 3) 
set xlabel 'mm'
datas = "A B C";
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set ylabel texture
## set ytics format ''
set lmargin at screen leftSpacing
set rmargin at screen canvasWidth + leftSpacing
set tmargin at screen 2*canvasHeight+vertBotSpacing+vertMidSpacing
set bmargin at screen (canvasHeight+vertBotSpacing+vertMidSpacing)
## set lmargin at screen leftSpacing + canvasWidth+horizSpacing
## set rmargin at screen leftSpacing + 2*canvasWidth+horizSpacing
 plot file using (1):(A_mean-A_ssd):(A_min):(A_max):(A_mean+A_ssd) @candlestickStyle,\
 '' using (1):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2):(B_mean-B_ssd):(B_min):(B_max):(B_mean+B_ssd) @candlestickStyle,\
 '' using (2):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3):(C_mean-C_ssd):(C_min):(C_max):(C_mean+C_ssd) @candlestickStyle,\
 '' using (3):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle
 
file = texture.'Noise.dat'
set boxwidth .1 
set ytics format ""
set xrange [0.5:3.5]
unset xtics
set xtics ("17" 1, "34" 2, "68" 3)
unset logscale y
set title 'Noise'
unset ylabel
set ytics format ''
set xlabel '$\sigma$, A.u.'
datas = "A B C";
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
unset ylabel
set lmargin at screen leftSpacing + canvasWidth+horizSpacing
set rmargin at screen leftSpacing + 2*canvasWidth+horizSpacing
 plot file using (1):(A_mean-A_ssd):(A_min):(A_max):(A_mean+A_ssd) @candlestickStyle,\
 '' using (1):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2):(B_mean-B_ssd):(B_min):(B_max):(B_mean+B_ssd) @candlestickStyle,\
 '' using (2):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3):(C_mean-C_ssd):(C_min):(C_max):(C_mean+C_ssd) @candlestickStyle,\
 '' using (3):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle

 
file =  texture.'ADC.dat'
set boxwidth .15 
set title 'b-values'
set xrange [0.5:4.5]
set xtics ('b: 200--1000' 1, 'b: 0--1000' 2, 'b: 200, 1000' 3, 'b: 0, 1000' 4) right rotate by 30 offset 3,0
set xlabel 's/mm$^2$'
unset ylabel
set ytics format ''
datas = "A B C D";
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set lmargin at screen leftSpacing + 2*canvasWidth+2*horizSpacing
set rmargin at screen leftSpacing + 3*canvasWidth+2*horizSpacing
## set lmargin at screen leftSpacing + canvasWidth+horizSpacing
## set rmargin at screen leftSpacing + 2*canvasWidth+horizSpacing 
 plot file using (1):(A_mean-A_ssd):(A_min):(A_max):(A_mean+A_ssd) @candlestickStyle,\
 '' using (1):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2):(B_mean-B_ssd):(B_min):(B_max):(B_mean+B_ssd) @candlestickStyle,\
 '' using (2):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3):(C_mean-C_ssd):(C_min):(C_max):(C_mean+C_ssd) @candlestickStyle,\
 '' using (3):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle,\
 '' using (4):(D_mean-D_ssd):(D_min):(D_max):(D_mean+D_ssd) @candlestickStyle,\
 '' using (4):(D_mean):(D_mean):(D_mean):(D_mean) @candlestickStyle
 
 
file = texture.'GLCMs.dat'
datas = "A B C D E";
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)
}
set xtics 1
dx = 0.05
set boxwidth .2
## set logscale y
set title 'Gray levels'
set xrange [0:6]
## set yrange [-1:1]
unset xtics
set xtics ("8" 1, "16" 2, "32" 3, "64" 4, "128" 5)
set ylabel texture
set xlabel 'Gray levels'
set ytics format '%g'
set lmargin at screen leftSpacing
set rmargin at screen canvasWidth + leftSpacing
set tmargin at screen canvasHeight+vertBotSpacing
set bmargin at screen vertBotSpacing
## set lmargin at screen leftSpacing
## set rmargin at screen canvasWidth + leftSpacing
## set tmargin at screen 2*canvasHeight+vertBotSpacing+vertMidSpacing
## set bmargin at screen (canvasHeight+vertBotSpacing+vertMidSpacing)
plot file using (1):(A_mean-A_ssd):(A_min):(A_max):(A_mean+A_ssd) @candlestickStyle,\
 '' using (1):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2):(B_mean-B_ssd):(B_min):(B_max):(B_mean+B_ssd) @candlestickStyle,\
 '' using (2):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3):(C_mean-C_ssd):(C_min):(C_max):(C_mean+C_ssd) @candlestickStyle,\
 '' using (3):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle,\
 '' using (4):(D_mean-D_ssd):(D_min):(D_max):(D_mean+D_ssd) @candlestickStyle,\
 '' using (4):(D_mean):(D_mean):(D_mean):(D_mean) @candlestickStyle,\
 '' using (5):(E_mean-E_ssd):(E_min):(E_max):(E_mean+E_ssd) @candlestickStyle,\
 '' using (5):(E_mean):(E_mean):(E_mean):(E_mean) @candlestickStyle
 


file = texture.'QuantMethod.dat'
set title 'Quant. method' 
unset ylabel
set ytics format ''
set xrange [0.5:3.5]
set xtics ('AutoROI' 1, 'AutoSlice' 2, 'Manual' 3) right rotate by 30 offset -2,-1.5
unset xlabel
datas = "A B C";
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set boxwidth .1 
set lmargin at screen leftSpacing + canvasWidth+horizSpacing
set rmargin at screen leftSpacing + 2*canvasWidth+horizSpacing 
## set lmargin at screen leftSpacing + 2*canvasWidth+2*horizSpacing
## set rmargin at screen leftSpacing + 3*canvasWidth+2*horizSpacing
 plot file using (1):(A_mean-A_ssd):(A_min):(A_max):(A_mean+A_ssd) @candlestickStyle,\
 '' using (1):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2):(B_mean-B_ssd):(B_min):(B_max):(B_mean+B_ssd) @candlestickStyle,\
 '' using (2):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3):(C_mean-C_ssd):(C_min):(C_max):(C_mean+C_ssd) @candlestickStyle,\
 '' using (3):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle
