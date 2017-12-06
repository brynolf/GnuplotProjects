reset
set terminal epslatex standalone color size 17cm, 15cm header \
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
set xrange [1:256]
set xtics 32,32,256

topSpace = 0.06
midVSpace1 = 0.02
midVSpace2 = 0.02
bottomSpace = 0.1

leftSpace = 0.085
midHSpace = 0.08
rightSpace = 0.3

plotWidth = (1-leftSpace-midHSpace-rightSpace)/2
plotHeight= (1-topSpace-midVSpace1-midVSpace2-bottomSpace)/3

set lmargin at screen leftSpace
set rmargin at screen leftSpace + plotWidth
set tmargin at screen bottomSpace + midVSpace2 +midVSpace1 + 2*plotHeight
set bmargin at screen bottomSpace + midVSpace2 +midVSpace1 + 3*plotHeight
set ylabel 'Feature values' offset 0.6,0
set yrange [0.2:1e8]
set ytics format '$10^{%T}$' 
set mytics 10
set title '\Large Original features' offset 0,-.6
unset key
plot 'SumVariance_OriginalGland.csv' using 1:2 with lines notitle ls 2 lw 3,\
	'AutoCorrelation_OriginalGland.csv' using 1:2 with lines ls 4 lw 3 notitle,\
	'SumAverage_OriginalGland.csv' using 1:2 with lines notitle ls 5 lw 3,\
	'Dissimilarity_OriginalGland.csv' using 1:2 with lines ls 9 lw 3 notitle,\
	'SumOfSquaresVariance_OriginalGland.csv' using 1:2 with lines ls 3 lw 3 notitle,\
	'ClusterProminence_OriginalGland.csv' using 1:2 with lines ls 1 lw 3 notitle,\
	'contrast_OriginalGland.csv' using 1:2 with lines notitle ls 6 lw 3 ,\
	'DifferenceVariance_OriginalGland.csv' using 1:2 with lines ls 7 lw 3 notitle,\
	'ClusterShade_OriginalGland.csv' using 1:2 with lines ls 8 lw 3 notitle
	
	
unset ylabel
set lmargin at screen leftSpace + plotWidth + midHSpace 
set rmargin at screen leftSpace + 2*plotWidth + midHSpace 
unset logscale y
set yrange [-0.02:.1]
set ytics -0.2,0.02,0.1 format '$%g$' 
unset mytics 
set key at screen keyHoriz+.015,0.93 reverse Left
set title '\Large Invariant Features' offset 0,-.6
plot 'SumVariance_InvariantGland.csv' using 1:2 with lines ls 2 lw 3 title 'Sum variance',\
	'AutoCorrelation_InvariantGland.csv' using 1:($2/10) with lines ls 4 lw 3 title 'Autocorrelation',\
	'SumAverage_InvariantGland.csv' using 1:($2/10) with lines ls 5 lw 3 title 'Sum average',\
	'Dissimilarity_InvariantGland.csv' using 1:2 with lines ls 9 lw 3 title 'Dissimilarity',\
	'SumOfSquaresVariance_InvariantGland.csv' using 1:2 with lines ls 3 lw 3 title 'Sum of Squares',\
	'ClusterProminence_InvariantGland.csv' using 1:2 with lines ls 1 lw 3 title 'Cluster prominence',\
	'contrast_InvariantGland.csv' using 1:2 with lines ls 6 lw 3 title 'Contrast',\
	'DifferenceVariance_InvariantGland.csv' using 1:2 with lines ls 7 lw 3 title 'Difference Variance',\
	'ClusterShade_InvariantGland.csv' using 1:2 with lines ls 8 lw 3  title 'Cluster shade'
	
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
set yrange [.1:10]
set mytics 10 
set ylabel 'Feature values' offset 0.55,0
plot 'informationMeasureOfCorrelation1_OriginalGland.csv' using 1:($2*-1) with lines ls 5 lw 3 notitle,\
	'informationMeasureOfCorrelation2_OriginalGland.csv' using 1:2 with lines ls 6 lw 3 notitle,\
	'correlation_OriginalGland.csv' using 1:2 with lines ls 1 lw 3 notitle,\
	'SumEntropy_OriginalGland.csv' using 1:2 with lines ls 2 lw 3 notitle,\
	'Entropy_OriginalGland.csv' using 1:2 with lines ls 3 lw 3 notitle,\
	'DifferenceEntropy_OriginalGland.csv' using 1:2 with lines ls 4 lw 3 notitle
	
	
unset ylabel
unset mytics 
unset yrange 
set ytics -2,1,3
set yrange [-3:2.5]
set lmargin at screen leftSpace + plotWidth + midHSpace 
set rmargin at screen leftSpace + 2*plotWidth + midHSpace 
unset logscale y
set key at screen keyHoriz,0.62 reverse Left
plot 'informationMeasureOfCorrelation1_InvariantGland.csv' using 1:($2) with lines ls 5 lw 3 t 'Inf. meas. Corr 1',\
	'informationMeasureOfCorrelation2_InvariantGland.csv' using 1:($2*2) with lines ls 6 lw 3 t  'Inf. meas. Corr 2',\
	'correlation_InvariantGland.csv' using 1:($2) with lines ls 1 lw 3 t 'Correlation',\
	'SumEntropy_InvariantGland.csv' using 1:2 with lines ls 2 lw 3 t 'Sum Entropy',\
	'Entropy_InvariantGland.csv' using 1:($2*0.5) with lines ls 3 lw 3 t 'Entropy',\
	'DifferenceEntropy_InvariantGland.csv' using 1:2 with lines ls 4 lw 3 t 'Difference entropy'
	
	

unset yrange 
set lmargin at screen leftSpace
set rmargin at screen leftSpace + plotWidth
set tmargin at screen bottomSpace
set bmargin at screen bottomSpace + plotHeight
	
set xlabel 'Gray levels $N$' offset 0,-.4
set logscale y
set ytics autofreq
set yrange [1e-4:.9]
set ytics format '$10^{%T}$' 
set xtics format "%g" rotate by -45
set mytics 10
set ylabel 'Feature values' offset 1.55,0
plot 'MaximumProbability_OriginalGland.csv' using 1:2 with lines ls 3 lw 3 notitle,\
	'Energy_OriginalGland.csv' using 1:2 with lines ls 1 lw 3 notitle,\
	'Homogeneity_OriginalGland.csv' using 1:2 with lines ls 2 lw 3 notitle,\
	'InverseDifference_OriginalGland.csv' using 1:2 with lines ls 4 lw 3 notitle

unset ylabel
set yrange [-5:35]	
set lmargin at screen leftSpace + plotWidth + midHSpace 
set rmargin at screen leftSpace + 2*plotWidth + midHSpace 
unset logscale y
set ytics 0,20,150 format '$%g$' 
unset mytics
unset logscale y
set key at screen 1.05,0.29 reverse Left
plot 'Energy_InvariantGland.csv' using 1:2 with lines ls 1 lw 3 t 'Energy',\
	'Homogeneity_InvariantGland.csv' using 1:($2*10) with lines ls 2 lw 3 t 'Homogeneity',\
	'InverseDifference_InvariantGland.csv' using 1:($2*5) with lines ls 4 lw 3 t 'Inverse Difference',\
	'MaximumProbability_InvariantGland.csv' using 1:2 with lines ls 3 lw 3 t 'Max Prob.