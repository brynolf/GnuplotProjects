reset
set terminal epslatex standalone size 15cm,12cm
set output 'plotHist2.tex'
set logscale y
plot 'hist.dat' 1:2 using bars