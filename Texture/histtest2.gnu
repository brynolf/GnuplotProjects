reset
set term epslatex standalone size 13.02cm,8cm 
set output 'histtest2.tex'

set key inside left top vertical Right noreverse enhanced autotitle nobox
set xzeroaxis
set yzeroaxis
set title "Normal Distribution" 

## ==================Change this!
Min = -4.9 # where binning starts
Max = 4.9 # where binning ends
n = 101 # the number of bins
## ==============================

bw = (Max-Min)/n # binwidth; evaluates to 1.0
bin(x) = bw*(floor((x-Min)/bw)+0.5) + Min
## bin(x,bw) = bw*floor(x/bw)+bw/2.0
set boxwidth bw 

## Plot
plot "corr.dat" u (bin($1)):(1.0) smooth freq notitle w boxes