reset
set terminal epslatex standalone color size 17cm, 14cm font "cmr,9" 
set output 'distributionPlotContrastCorrelation.tex'
set datafile separator ","


texture = 'Contrast'

leftSpacing  	= 0.07
horizSpacing 	= 0.02
rightSpacing    = 0.01
vertTopSpacing  = 0.03
vertMidSpacing  = 0.02
vertBotSpacing  = 0.12
NumberOfRows 	= 5
canvasWidth  	= (1-(leftSpacing +4*horizSpacing+rightSpacing))/5
canvasHeight 	= (1-vertTopSpacing-(NumberOfRows-1)*vertMidSpacing-vertBotSpacing)/NumberOfRows
widthFactor  = 2
set border front
## Set significance marker style
candlestickStyle = 'with candlesticks whiskerbars lc rgb "#000000" notitle'
titleStyle = 'font "cmr, 10"
significantMarker = "'\\LARGE *' at graph 0.06,0.85"

set multiplot layout NumberOfRows,5

# --------------------------------------------------------------------------

set ylabel texture offset 1.4,0
rowNum = 1
set lmargin at screen leftSpacing
set rmargin at screen canvasWidth + leftSpacing
tm = (NumberOfRows-rowNum+1)*canvasHeight+(NumberOfRows-rowNum)*vertMidSpacing + vertBotSpacing
rowNum = rowNum + 1
set tmargin at screen tm
set bmargin at screen tm - canvasHeight
file = texture.'GLCMs.dat'
set xtics format ""
## unset xtics

set boxwidth .2*widthFactor 
set title '\# gray levels' offset 0,-0.89
set xrange [0:6]
yr = '[0.2:10000]'
datas = "A B C D E";
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)
}
set label 99 @significantMarker
set yrange @yr
set ytics 0,10,3000
set logscale y
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle,\
 '' using (4):(D_lo_quartile):(D_min):(D_max):(D_up_quartile) @candlestickStyle,\
 '' using (4):(D_mean):(D_mean):(D_mean):(D_mean) @candlestickStyle,\
 '' using (5):(E_lo_quartile):(E_min):(E_max):(E_up_quartile) @candlestickStyle,\
 '' using (5):(E_mean):(E_mean):(E_mean):(E_mean) @candlestickStyle
 

set lmargin at screen leftSpacing + canvasWidth+horizSpacing
set rmargin at screen leftSpacing + 2*canvasWidth+horizSpacing
file = texture.'QuantMethod.dat'
unset ylabel
set ytics format ''
unset xlabel
set boxwidth .1*widthFactor  
set title 'Quant. method' 
set xrange [0.5:3.5]
datas = "A B C";
unset logscale y
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set yrange @yr
set logscale y
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle
 

set lmargin at screen leftSpacing + 2*canvasWidth+2*horizSpacing
set rmargin at screen leftSpacing + 3*canvasWidth+2*horizSpacing
file = texture.'Resolution.dat'

set boxwidth .1*widthFactor 
set title 'Resolution' offset 0,-0.89
set xrange [0.5:3.5] 
datas = "A B C";
unset logscale y
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set yrange @yr
set logscale y
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle

 
set lmargin at screen leftSpacing + 3*canvasWidth+3*horizSpacing
set rmargin at screen leftSpacing + 4*canvasWidth+3*horizSpacing
file = texture.'Noise.dat'
set boxwidth .1*widthFactor  
set ytics format ""
set xrange [0.5:3.5]

set title 'Noise'
unset ylabel
set ytics format ''
unset ylabel
datas = "A B C";
unset logscale y
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set yrange @yr
set logscale y
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle

set lmargin at screen leftSpacing + 4*canvasWidth+4*horizSpacing
set rmargin at screen leftSpacing + 5*canvasWidth+4*horizSpacing
file =  texture.'ADC.dat'
unset ylabel
set ytics format ''
set boxwidth .15*widthFactor 
set title 'ADC b-values'
set xrange [0.5:4.5]
datas = "A B C D";
unset logscale y
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
unset label 99
set logscale y
set yrange @yr
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle,\
 '' using (4):(D_lo_quartile):(D_min):(D_max):(D_up_quartile) @candlestickStyle,\
 '' using (4):(D_mean):(D_mean):(D_mean):(D_mean) @candlestickStyle

# --------------------------------------------------------------------------
yr = '[-0.1:1.2]'
texture = 'Correlation'
unset logscale y
unset title
set lmargin at screen leftSpacing
set rmargin at screen canvasWidth + leftSpacing
tm = (NumberOfRows-rowNum+1)*canvasHeight+(NumberOfRows-rowNum)*vertMidSpacing + vertBotSpacing
rowNum = rowNum + 1
set tmargin at screen tm
set bmargin at screen tm-canvasHeight

file = texture.'GLCMs.dat'
set xtics 1
set ylabel texture offset .4,0
set ytics -1,0.2,1 format '%g'
set yrange [0:1.2]
set boxwidth .2*widthFactor 
set xrange [0:6]

unset yrange
datas = "A B C D E";
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)
}
set yrange @yr
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle,\
 '' using (4):(D_lo_quartile):(D_min):(D_max):(D_up_quartile) @candlestickStyle,\
 '' using (4):(D_mean):(D_mean):(D_mean):(D_mean) @candlestickStyle,\
 '' using (5):(E_lo_quartile):(E_min):(E_max):(E_up_quartile) @candlestickStyle,\
 '' using (5):(E_mean):(E_mean):(E_mean):(E_mean) @candlestickStyle
 

set lmargin at screen leftSpacing + canvasWidth+horizSpacing
set rmargin at screen leftSpacing + 2*canvasWidth+horizSpacing
file = texture.'QuantMethod.dat'
unset ylabel
set ytics format ''
set xrange [0.5:3.5]
unset xlabel
datas = "A B C";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set yrange @yr
set boxwidth .1*widthFactor  
 plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle
 

set lmargin at screen leftSpacing + 2*canvasWidth+2*horizSpacing
set rmargin at screen leftSpacing + 3*canvasWidth+2*horizSpacing
file = texture.'Resolution.dat'
set boxwidth .1*widthFactor  
set xrange [0.5:3.5] 

datas = "A B C";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set label 99 @significantMarker
set yrange @yr
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle
 

set lmargin at screen leftSpacing + 3*canvasWidth+3*horizSpacing
set rmargin at screen leftSpacing + 4*canvasWidth+3*horizSpacing
file = texture.'Noise.dat'
set boxwidth .1*widthFactor  
set ytics format ""
set xrange [0.5:3.5]

unset logscale y
unset ylabel
set ytics format ''
datas = "A B C";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set yrange @yr
unset ylabel
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle

 
set lmargin at screen leftSpacing + 4*canvasWidth+4*horizSpacing
set rmargin at screen leftSpacing + 5*canvasWidth+4*horizSpacing 
file =  texture.'ADC.dat'
set boxwidth .15*widthFactor  
unset ylabel
set xrange [0.5:4.5]
## set xtics ('b: 200--1000' 1, 'b: 0--1000' 2, 'b: 200, 1000' 3, 'b: 0, 1000' 4) right rotate by 30 offset 2,0
## set xlabel 's/mm$^2$'
set ytics format ''
datas = "A B C D";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}

unset label 99
set yrange @yr
 plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle,\
 '' using (4):(D_lo_quartile):(D_min):(D_max):(D_up_quartile) @candlestickStyle,\
 '' using (4):(D_median):(D_median):(D_median):(D_median) @candlestickStyle
 
# -------------------------------------------------------------------------- 
yr = '[0.0002:1]'
texture = 'Energy'
unset title
set lmargin at screen leftSpacing
set rmargin at screen canvasWidth + leftSpacing
tm = (NumberOfRows-rowNum+1)*canvasHeight+(NumberOfRows-rowNum)*vertMidSpacing + vertBotSpacing
rowNum = rowNum + 1
set tmargin at screen tm
set bmargin at screen tm-canvasHeight

file = texture.'GLCMs.dat'

datas = "A B C D E";
unset logscale y
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)
}
set logscale y
set xtics 1
set ylabel texture offset 2.45,0
set ytics 0,10,1 format '%g'
set yrange @yr
set boxwidth .2*widthFactor 
set xrange [0:6]
set label 99 @significantMarker
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle,\
 '' using (4):(D_lo_quartile):(D_min):(D_max):(D_up_quartile) @candlestickStyle,\
 '' using (4):(D_median):(D_median):(D_median):(D_median) @candlestickStyle,\
 '' using (5):(E_lo_quartile):(E_min):(E_max):(E_up_quartile) @candlestickStyle,\
 '' using (5):(E_median):(E_median):(E_median):(E_median) @candlestickStyle
 

set lmargin at screen leftSpacing + canvasWidth+horizSpacing
set rmargin at screen leftSpacing + 2*canvasWidth+horizSpacing
file = texture.'QuantMethod.dat'
unset ylabel
set ytics format ''
set xrange [0.5:3.5]
unset xlabel
datas = "A B C";
unset logscale y
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set yrange @yr
set logscale y
set boxwidth .1*widthFactor  
 plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle
 

set lmargin at screen leftSpacing + 2*canvasWidth+2*horizSpacing
set rmargin at screen leftSpacing + 3*canvasWidth+2*horizSpacing
file = texture.'Resolution.dat'
set boxwidth .1*widthFactor  
unset title
set xrange [0.5:3.5] 

datas = "A B C";
unset logscale y
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
unset label 99
set logscale y
set yrange @yr
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle
 
set label 99 @significantMarker
set lmargin at screen leftSpacing + 3*canvasWidth+3*horizSpacing
set rmargin at screen leftSpacing + 4*canvasWidth+3*horizSpacing
file = texture.'Noise.dat'
set boxwidth .1*widthFactor  
set ytics format ""
set xrange [0.5:3.5]

unset logscale y
unset ylabel
set ytics format ''
datas = "A B C";
unset logscale y
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set logscale y
set yrange @yr
unset ylabel
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle

 
set lmargin at screen leftSpacing + 4*canvasWidth+4*horizSpacing
set rmargin at screen leftSpacing + 5*canvasWidth+4*horizSpacing 
file =  texture.'ADC.dat'
set boxwidth .15*widthFactor  
unset ylabel
set xrange [0.5:4.5]
## set xtics ('b: 200--1000' 1, 'b: 0--1000' 2, 'b: 200, 1000' 3, 'b: 0, 1000' 4) right rotate by 30 offset 2,0
## set xlabel 's/mm$^2$'
set ytics format ''
datas = "A B C D";
unset logscale y
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set logscale y
set yrange @yr
unset label 99
 plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle,\
 '' using (4):(D_lo_quartile):(D_min):(D_max):(D_up_quartile) @candlestickStyle,\
 '' using (4):(D_median):(D_median):(D_median):(D_median) @candlestickStyle 

# --------------------------------------------------------------------------
set label 99 @significantMarker
yr = '[2:9]'
texture = 'Entropy'
unset title
set lmargin at screen leftSpacing
set rmargin at screen canvasWidth + leftSpacing
tm = (NumberOfRows-rowNum+1)*canvasHeight+(NumberOfRows-rowNum)*vertMidSpacing + vertBotSpacing
rowNum = rowNum + 1
set tmargin at screen tm
set bmargin at screen tm-canvasHeight

file = texture.'GLCMs.dat'
set xtics 1
set ylabel texture offset -1.6,0
set ytics 0,2,10 format '%g'

set boxwidth .2*widthFactor 
set xrange [0:6]

unset logscale y
unset yrange
datas = "A B C D E";
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)
}
set yrange @yr
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle,\
 '' using (4):(D_lo_quartile):(D_min):(D_max):(D_up_quartile) @candlestickStyle,\
 '' using (4):(D_median):(D_median):(D_median):(D_median) @candlestickStyle,\
 '' using (5):(E_lo_quartile):(E_min):(E_max):(E_up_quartile) @candlestickStyle,\
 '' using (5):(E_median):(E_median):(E_median):(E_median) @candlestickStyle
 

set lmargin at screen leftSpacing + canvasWidth+horizSpacing
set rmargin at screen leftSpacing + 2*canvasWidth+horizSpacing
file = texture.'QuantMethod.dat'
unset ylabel
set ytics format ''
set xrange [0.5:3.5]
unset xlabel
datas = "A B C";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set yrange @yr
set boxwidth .1*widthFactor  
 plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle
 

set lmargin at screen leftSpacing + 2*canvasWidth+2*horizSpacing
set rmargin at screen leftSpacing + 3*canvasWidth+2*horizSpacing
file = texture.'Resolution.dat'
set boxwidth .1*widthFactor  
unset title
set xrange [0.5:3.5] 

datas = "A B C";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set yrange @yr
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle
 

set lmargin at screen leftSpacing + 3*canvasWidth+3*horizSpacing
set rmargin at screen leftSpacing + 4*canvasWidth+3*horizSpacing
file = texture.'Noise.dat'
set boxwidth .1*widthFactor  
set ytics format ""
set xrange [0.5:3.5]

unset logscale y
unset ylabel
set ytics format ''
datas = "A B C";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set yrange @yr
unset ylabel
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle

 
set lmargin at screen leftSpacing + 4*canvasWidth+4*horizSpacing
set rmargin at screen leftSpacing + 5*canvasWidth+4*horizSpacing 
file =  texture.'ADC.dat'
set boxwidth .15*widthFactor  
unset ylabel
set xrange [0.5:4.5]
## set xtics ('b: 200--1000' 1, 'b: 0--1000' 2, 'b: 200, 1000' 3, 'b: 0, 1000' 4) right rotate by 30 offset 2,0
## set xlabel 's/mm$^2$'
set ytics format ''
datas = "A B C D";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
unset label 99
set yrange @yr
 plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle,\
 '' using (4):(D_lo_quartile):(D_min):(D_max):(D_up_quartile) @candlestickStyle,\
 '' using (4):(D_median):(D_median):(D_median):(D_median) @candlestickStyle 
 
 
# --------------------------------------------------------------------------
set label 99 @significantMarker
yr = '[0:.9]' 
texture = 'Homogeneity'
unset title
set lmargin at screen leftSpacing
set rmargin at screen canvasWidth + leftSpacing
tm = (NumberOfRows-rowNum+1)*canvasHeight+(NumberOfRows-rowNum)*vertMidSpacing + vertBotSpacing
rowNum = rowNum + 1
set tmargin at screen tm
set bmargin at screen tm-canvasHeight

file = texture.'GLCMs.dat'
set xtics 1
set ylabel texture offset 0.5,0
set ytics 0,0.2,1 format '%g'
set boxwidth .2*widthFactor 
set xrange [0:6]
set xlabel '\# gray levels'

set xtics ("8" 1, "16" 2, "32" 3, "64" 4, "128" 5)
datas = "A B C D E";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)
}
set yrange @yr
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle,\
 '' using (4):(D_lo_quartile):(D_min):(D_max):(D_up_quartile) @candlestickStyle,\
 '' using (4):(D_median):(D_median):(D_median):(D_median) @candlestickStyle,\
 '' using (5):(E_lo_quartile):(E_min):(E_max):(E_up_quartile) @candlestickStyle,\
 '' using (5):(E_median):(E_median):(E_median):(E_median) @candlestickStyle
 

set lmargin at screen leftSpacing + canvasWidth+horizSpacing
set rmargin at screen leftSpacing + 2*canvasWidth+horizSpacing
file = texture.'QuantMethod.dat'
unset ylabel
set ytics format ''
set xrange [0.5:3.5]
set xtics ('AutoROI' 1, 'AutoSlice' 2, 'Manual' 3) right rotate by 30 offset 0,-1.5
unset xlabel
datas = "A B C";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set yrange @yr
set boxwidth .1*widthFactor  
 plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle
 

set lmargin at screen leftSpacing + 2*canvasWidth+2*horizSpacing
set rmargin at screen leftSpacing + 3*canvasWidth+2*horizSpacing
file = texture.'Resolution.dat'
set boxwidth .1*widthFactor  
unset title
set xrange [0.5:3.5] 


set xtics ('1.2' 1, '1.8' 2, '3.6' 3) rotate by 0 offset 0,0
set xlabel 'mm'
datas = "A B C";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set yrange @yr
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle
 

set lmargin at screen leftSpacing + 3*canvasWidth+3*horizSpacing
set rmargin at screen leftSpacing + 4*canvasWidth+3*horizSpacing
file = texture.'Noise.dat'
set boxwidth .1*widthFactor  
set ytics format ""
set xrange [0.5:3.5]

set xtics ("17" 1, "34" 2, "68" 3)
unset logscale y
unset ylabel
set ytics format ''
set xlabel '$\sigma$, A.u.'
datas = "A B C";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
set yrange @yr
unset ylabel
plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle

 
set lmargin at screen leftSpacing + 4*canvasWidth+4*horizSpacing
set rmargin at screen leftSpacing + 5*canvasWidth+4*horizSpacing 
file =  texture.'ADC.dat'
set boxwidth .15*widthFactor  
unset ylabel
set xrange [0.5:4.5]
set xtics ('b: 200--1000' 1, 'b: 0--1000' 2, 'b: 200, 1000' 3, 'b: 0, 1000' 4) right rotate by 30 offset 2,0
set xlabel 's/mm$^2$' offset 0,0.5
set ytics format ''
datas = "A B C D";
unset yrange
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)	
}
unset label 99
set yrange @yr
 plot file using (1):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) @candlestickStyle,\
 '' using (1):(A_median):(A_median):(A_median):(A_median) @candlestickStyle,\
 '' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) @candlestickStyle,\
 '' using (2):(B_median):(B_median):(B_median):(B_median) @candlestickStyle,\
 '' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) @candlestickStyle,\
 '' using (3):(C_median):(C_median):(C_median):(C_median) @candlestickStyle,\
 '' using (4):(D_lo_quartile):(D_min):(D_max):(D_up_quartile) @candlestickStyle,\
 '' using (4):(D_median):(D_median):(D_median):(D_median) @candlestickStyle