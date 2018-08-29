reset
set terminal epslatex standalone color size 17cm, 5cm font "cmr,8" 
set output 'plot2.tex'


set multiplot layout 1,4
unset border
unset xtics
unset ytics
set size ratio -1

set lmargin 0
set rmargin 0
plot 'plot21.png' binary filetype=png with rgbimage notitle
set lmargin 0.01
set rmargin 0.01
plot 'plot22.png' binary filetype=png with rgbimage notitle 
plot 'plot23.png' binary filetype=png with rgbimage notitle
plot 'plot24.png' binary filetype=png with rgbimage notitle 