reset
set terminal epslatex standalone color size 17cm, 12cm header \
"\\usepackage[bitstream-charter]{mathdesign}"
set output 'featuresPlots.tex'
unset style line
load 'dark2.pal'

set datafile separator ','
set multiplot

keyHoriz = 1.05

set logscale y
set mytics 10

set xtics format " " 
set xrange [1:128]
set xtics 0,32,256

topSpace = 0.06
midVSpace1 = 0.04
midVSpace2 = 0.04
bottomSpace = 0.1

leftSpace = 0.1
midHSpace = 0.08
rightSpace = 0.3

plotWidth = (1-leftSpace-midHSpace-rightSpace)/2
plotHeight= (1-topSpace-midVSpace1-midVSpace2-bottomSpace)/3

set lmargin at screen leftSpace
set rmargin at screen leftSpace + plotWidth
set tmargin at screen bottomSpace + midVSpace2 +midVSpace1 + 2*plotHeight
set bmargin at screen bottomSpace + midVSpace2 +midVSpace1 + 3*plotHeight
set ylabel 'Feature values' offset 0.8,0
set yrange [0.2:1e7]
set ytics format '$10^{%T}$' 
set mytics 10
set title '\Large Original features' offset 0,-.6
plot 'SumVariance.dat' using 1:2 with lines notitle ls 2 lw 3,\
	'Dissimilarity.dat' using 1:2 with lines ls 9 lw 3 notitle,\
	'AutoCorrelation.dat' using 1:2 with lines ls 4 lw 3 notitle,\
	'SumAverage.dat' using 1:2 with lines notitle ls 5 lw 3,\
	'SumOfSquaresVariance.dat' using 1:2 with lines ls 3 lw 3 notitle,\
	'ClusterProminence.dat' using 1:2 with lines ls 1 lw 3 notitle,\
	'contrast.dat' using 1:2 with lines notitle ls 6 lw 3 ,\
	'DifferenceVariance.dat' using 1:2 with lines ls 7 lw 3 notitle,\
	'ClusterShade.dat' using 1:2 with lines ls 8 lw 3 notitle
	
	
unset ylabel
set lmargin at screen leftSpace + plotWidth + midHSpace 
set rmargin at screen leftSpace + 2*plotWidth + midHSpace 
unset logscale y
set yrange [-0.02:0.09]
set ytics -0.0,0.02,0.09 format '$%g$' 
unset mytics 
set key at screen keyHoriz+.015,0.96 reverse Left
set title '\Large InvariantAll Features' offset 0,-.6
plot 'SumVarianceInvariantAll.dat' using 1:2 with lines ls 2 lw 3 title 'Sum variance',\
	'DissimilarityInvariantAll.dat' using 1:2 with lines ls 9 lw 3 title 'Dissimilarity',\
	'AutoCorrelationInvariantAll.dat' using 1:($2/10) with lines ls 4 lw 3 title 'Autocorrelation',\
	'SumAverageInvariantAll.dat' using 1:($2/10) with lines ls 5 lw 3 title 'Sum average',\
	'SumOfSquaresVarianceInvariantAll.dat' using 1:2 with lines ls 3 lw 3 title 'Sum of Squares',\
	'ClusterProminenceInvariantAll.dat' using 1:2 with lines ls 1 lw 3 title 'Cluster prominence',\
	'contrastInvariantAll.dat' using 1:2 with lines ls 6 lw 3 title 'Contrast',\
	'DifferenceVarianceInvariantAll.dat' using 1:2 with lines ls 7 lw 3 title 'Difference Variance',\
	'ClusterShadeInvariantAll.dat' using 1:2 with lines ls 8 lw 3  title 'Cluster shade'
	
unset yrange 
unset title
set lmargin at screen leftSpace
set rmargin at screen leftSpace + plotWidth
set tmargin at screen bottomSpace + midVSpace2 + plotHeight
set bmargin at screen bottomSpace + midVSpace2 + 2*plotHeight

unset logscale y
set ytics autofreq
set logscale y
## set ytics 0.1,1,9 format '$%g$'
set yrange [.5:10]
set mytics 10 
set ylabel 'Feature values' offset -1.2,0
plot 'informationMeasureOfCorrelation1.dat' using 1:2 with lines ls 5 lw 3 notitle,\
	'informationMeasureOfCorrelation2.dat' using 1:2 with lines ls 6 lw 3 notitle,\
	'correlation.dat' using 1:2 with lines ls 1 lw 3 notitle,\
	'SumEntropy.dat' using 1:2 with lines ls 2 lw 3 notitle,\
	'DifferenceEntropy.dat' using 1:2 with lines ls 4 lw 3 notitle,\
	'Entropy.dat' using 1:2 with lines ls 3 lw 3 notitle
	
	
unset ylabel
unset mytics 
unset yrange 
set ytics -2,1,3
set yrange [-2.5:3]
set lmargin at screen leftSpace + plotWidth + midHSpace 
set rmargin at screen leftSpace + 2*plotWidth + midHSpace 
unset logscale y
set key at screen keyHoriz,0.62 reverse Left
plot 'informationMeasureOfCorrelation1InvariantAll.dat' using 1:($2) with lines ls 5 lw 3 t 'Inf. meas. Corr 1',\
	'informationMeasureOfCorrelation2InvariantAll.dat' using 1:($2*2) with lines ls 6 lw 3 t  'Inf. meas. Corr 2',\
	'correlationInvariantAll.dat' using 1:($2) with lines ls 1 lw 3 t 'Correlation',\
	'SumEntropyInvariantAll.dat' using 1:2 with lines ls 2 lw 3 t 'Sum Entropy',\
	'DifferenceEntropyInvariantAll.dat' using 1:2 with lines ls 4 lw 3 t 'Difference entropy',\
	'EntropyInvariantAll.dat' using 1:($2*0.5) with lines ls 3 lw 3 t 'Entropy'
	
	

unset yrange 
set lmargin at screen leftSpace
set rmargin at screen leftSpace + plotWidth
set tmargin at screen bottomSpace
set bmargin at screen bottomSpace + plotHeight
	
set xlabel 'Gray levels $N$'
set logscale y
set ytics autofreq
set yrange [1e-4:9e-1]
set ytics format '$10^{%T}$' 
set xtics format "%g"
set mytics 10
set ylabel 'Feature values' offset 0.75,0
plot 'MaximumProbability.dat' using 1:2 with lines ls 3 lw 3 notitle,\
	'Energy.dat' using 1:2 with lines ls 1 lw 3 notitle,\
	'Homogeneity.dat' using 1:2 with lines ls 2 lw 3 notitle,\
	'InverseDifference.dat' using 1:2 with lines ls 4 lw 3 notitle

unset ylabel
set yrange [0:35]	
set lmargin at screen leftSpace + plotWidth + midHSpace 
set rmargin at screen leftSpace + 2*plotWidth + midHSpace 
unset logscale y
set ytics 0,10,35 format '$%g$' 
unset mytics
unset logscale y
set key at screen 1.05,0.29 reverse Left
plot 'MaximumProbabilityInvariantAll.dat' using 1:2 with lines ls 3 lw 3 t 'Max Prob.',\
	'EnergyInvariantAll.dat' using 1:2 with lines ls 1 lw 3 t 'Energy',\
	'HomogeneityInvariantAll.dat' using 1:($2*10) with lines ls 2 lw 3 t 'Homogeneity',\
	'InverseDifferenceInvariantAll.dat' using 1:($2*5) with lines ls 4 lw 3 t 'Inverse Difference'