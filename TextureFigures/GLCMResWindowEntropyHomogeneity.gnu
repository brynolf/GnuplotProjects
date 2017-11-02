reset
set terminal epslatex standalone color size 14cm, 10cm font "cmr,8" 
set output 'GLCMResWindowMethodEntropyHomogeneity.tex'

## Set raneg of colorbar
## set cbrange [-1.5:1.5]
					  
## set xrange [ -0.5 : 18.5 ] noreverse nowriteback
## set yrange [ 15.5 : -0.5 ] noreverse 

set logscale y

set tics front
set title 'Skjskj'
plot 'GLCMResWindowsMethodEntropyHomogeneity.csv' using 16:1 with points pt 7  notitle,\
	'' using 17:2 with points pt 7 notitle,\
	'' using 18:3 with points pt 7 notitle,\
	'' using 19:4 with points pt 7 notitle,\
	'' using 20:5 with points pt 7 notitle,\
	'' using 21:6 with points pt 7 notitle,\
	'' using 22:7 with points pt 7 notitle,\
	'' using 23:8 with points pt 7 notitle,\
	'' using 24:9 with points pt 7 notitle,\
	'' using 25:10 with points pt 7 notitle,\
	'' using 26:11 with points pt 7 notitle,\
	'' using 27:12 with points pt 7 notitle,\
	'' using 28:13 with points pt 7 notitle,\
	'' using 29:14 with points pt 7 notitle,\
	'' using 30:15 with points pt 7 notitle
	