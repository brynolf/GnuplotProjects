reset
set terminal epslatex standalone color size 18cm, 6cm header \
"\\usepackage[bitstream-charter]{mathdesign}"
set output 'movement.tex'
load 'parula.pal'
set multiplot

vtop = 0.01
vbot = 0.01
hleft = 0.09
hmid = 0.09
hright = 0.02
siz = (1-hleft-hmid-hright)/2



set lmargin at screen hleft
set rmargin at screen hleft+siz
set key left
set title '\Large Translations'
set ylabel 'Translations (mm)' offset 1,1
set xlabel 'Time frame'

set yrange [-.6:1.6]
set ytics -.5,.5,1.5
set mytics 2

plot 'movementdata.dat' using ($0):1 with lines linestyle 1 lw 3 t 'x' ,\
 '' using ($0):2 with lines linestyle 4 lw 3 t 'y' ,\
 '' using ($0):3 with lines linestyle 8 lw 3 t 'z' 

set lmargin at screen hleft+siz+hmid
set rmargin at screen 1-hright
set title '\Large Rotations'
set ylabel 'Rotation (deg)' offset 1,1
set yrange [-1.5:2.2]
set ytics -1,1,2
set mytics 2
set xlabel 'Time frame'
plot 'movementdata.dat' using ($0):($4*180/3.14) with lines linestyle 1 lw 3 t 'x axis' ,\
 '' using ($0):($5*180/3.14) with lines linestyle 4 lw 3 t 'y axis' ,\
 '' using ($0):($6*180/3.14) with lines linestyle 8 lw 3 t 'z axis' 