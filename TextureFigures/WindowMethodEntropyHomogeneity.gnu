reset
set terminal epslatex standalone color size 14cm, 10cm font "cmr,8" 
set output 'WindowMethodEntropyHomogeneity.tex'

## Set raneg of colorbar
## set cbrange [-1.5:1.5]
					  
## set xrange [ -0.5 : 18.5 ] noreverse nowriteback
## set yrange [ 15.5 : -0.5 ] noreverse 

## set logscale y

set tics front
set title 'Skjskj'
set xlabel 'Correlation'
set ylabel 'Contrast'
plot 'WindowMethodsEntropyHomogeneity.csv' using 4:1 with points pt 7  notitle,\
	'' using 5:2 with points pt 7 notitle,\
	'' using 6:3 with points pt 7 notitle
	