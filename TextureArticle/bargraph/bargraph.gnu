reset
set terminal epslatex standalone color size 8cm, 5cm font "cmr,8" 
set output 'bargraph.tex'

set style data histogram
set style histogram cluster gap 3

set title '$R^2$ and $Q^2$'

set style fill solid border rgb "black"
set auto x 
set yrange [0:*]
set key outside right
plot 'bargraph.dat' using 1:xtic(1) title col, \
        '' using 2:xtic(1) title col
        