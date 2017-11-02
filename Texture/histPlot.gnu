reset
set terminal epslatex standalone size 30cm,30cm
set output 'histPlot.tex'
set multiplot layout 5,4
do for [i=1:20]{
plot "hist.dat" index i-1 u 1:2 notitle
}
unset multiplot