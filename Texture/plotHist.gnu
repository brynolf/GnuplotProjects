reset
set terminal svg size 3000,3000
set output 'plotHist.svg'

## set key autotitle columnhead

fileName = 'allData.rpt'
numPlots = 20
set datafile missing "NULL"

set multiplot layout 5,4
do for [i=1:numPlots]{
stats fileName u i

## ==================Change this!
Min = STATS_min # where binning starts
Max = STATS_max # where binning ends
n = 301 # the number of bins
## ==============================

bw = (Max-Min)/n # binwidth; evaluates to 1.0
## bin(x) = bw*(floor((x-Min)/bw)+0.5) + Min
bin(x) = bw*floor(x/bw)+bw/2.0

set boxwidth bw 

set table 'hist.dat'
plot fileName u (bin(column(i))):(1.0) smooth freq notitle
unset table
set boxwidth bw
## set terminal epslatex standalone size 30cm,30cm
plot "hist.dat" u 1:2 w boxes
}
unset multiplot

