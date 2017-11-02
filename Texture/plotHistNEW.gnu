reset
set terminal epslatex standalone size 30cm,30cm
set output 'plotHistNEW.tex'

set key autotitle columnhead

fileName = 'allData.rpt'
numPlots = 20

set multiplot layout 5,4
do for [i=1:numPlots]{
stats fileName u i

titles = "autoCorrelation        clusterProminence      clusterShade           contrast               correlation            differenceEntropy      dissimilarity          energy                 entropy                homogeneity1           homogeneity2           infMeasCorr1           infMeasCorr2           inverseDifferenceMoment normalizedInverseDiffMoment maxProbability         sumAverage             sumEntropy             sumOfSquares           sumVariance"


## ==================Change this!
Min = STATS_min # where binning starts
Max = STATS_max # where binning ends
n = 50 # the number of bins
## ==============================

bw = (Max-Min)/n # binwidth; evaluates to 1.0
## bin(x) = bw*(floor((x-Min)/bw)+0.5) + Min
bin(x) = bw*floor(x/bw)+bw/2.0

set boxwidth bw 

print bw
set xrange[Min:Max]

plot fileName u (bin(column(i))):(1.0) smooth freq w boxes t word(titles,i)

## set terminal epslatex standalone size 30cm,30cm
## plot "hist.dat" u 1:2 w boxes
}
unset multiplot

