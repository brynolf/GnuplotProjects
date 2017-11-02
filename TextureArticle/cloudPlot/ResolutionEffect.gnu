reset
set terminal epslatex standalone color size 18cm, 10cm font "cmr,8" 
set output 'ResolutionEffect.tex'
set datafile separator ","
set multiplot layout 3,3

textures = 'Autocorrelation Contrast Correlation Energy Entropy Dissimilarity Homogeneity SumOfSquares SumVariance'
candlestickStyle = 'with candlesticks whiskerbars lc rgb "#000000" notitle'
do for [i=1:words(textures)] {
unset logscale y
file = word(textures,i).'Resolution.dat'
datas = "A B C";
do for [index = 1:words(datas)] {
	stats file using index name word(datas,index)
}
set xtics ('$1.2\times1.2$' 1, '$1.8\times1.8$'  2, '$3.6\times3.6$'  3)
set title word(textures,i) offset 0,-1
set ytics format '%g'
set xrange [0.5:3.5]
set boxwidth .15 
## set logscale y
set lmargin 6
set rmargin 0.2
set bmargin 2
set tmargin 1
## set size 0.3,0.3 
plot file using (1):(A_mean-A_ssd):(A_min):(A_max):(A_mean+A_ssd) @candlestickStyle,\
 '' using (1):(A_mean):(A_mean):(A_mean):(A_mean) @candlestickStyle,\
 '' using (2):(B_mean-B_ssd):(B_min):(B_max):(B_mean+B_ssd) @candlestickStyle,\
 '' using (2):(B_mean):(B_mean):(B_mean):(B_mean) @candlestickStyle,\
 '' using (3):(C_mean-C_ssd):(C_min):(C_max):(C_mean+C_ssd) @candlestickStyle,\
 '' using (3):(C_mean):(C_mean):(C_mean):(C_mean) @candlestickStyle

}