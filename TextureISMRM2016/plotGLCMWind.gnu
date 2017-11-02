reset
set terminal epslatex standalone color size 12cm,12cm
set output 'plotGLCMWind.tex'
set multiplot layout 2,2 columnsfirst
set datafile separator ","
set logscale y
set mytics 10
set xtics -.4,.4,1.2
plot 'GLCMWind_correlation_contrast.dat' using 1:2 with dots lw 1.5 lc rgb "#228822"  notitle,\
	'' using 3:4 with dots lw 1.5 lc rgb "#882222" notitle,\
	'' using 5:6 with dots lw 1.5 lc rgb "#222288" notitle
	