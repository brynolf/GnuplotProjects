reset
set terminal epslatex standalone color size 18cm, 10cm font "cmr,8" 
set output 'GrayLevelEffect.tex'
set datafile separator ","
set multiplot layout 3,3

textures = 'Autocorrelation Contrast Correlation Energy Entropy Dissimilarity Homogeneity SumOfSquares SumVariance'
candlestickStyle = 'with candlesticks whiskerbars lc rgb "#000000" notitle'
do for [i=1:words(textures)] {
unset logscale y
file = word(textures,i).'GLCMs.dat'
datas = "A B C D E";
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)
}
set xtics ("8" 1, "16" 2, "32" 3, "64" 4, "128" 5)
set title word(textures,i) offset 0,-8.5
set ytics format '$10^{%T}$'
set xrange [0.5:5.5]
set boxwidth .15 
set logscale y
set lmargin 6
set rmargin 0.2
## set size 0.3,0.3 
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

}