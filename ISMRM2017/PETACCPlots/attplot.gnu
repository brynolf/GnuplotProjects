reset
set terminal epslatex standalone color size 17cm, 6cm header \
"\\usepackage{helvet}\\renewcommand{\\familydefault}{\\sfdefault}"
set output 'attplot.tex'

stat 'data.dat'

set yrange [-25:15]
set xrange [-2.78:203*2.78]

set ylabel 'Relative Activity [\%]'
set xlabel 'Position [mm]'

smallPoint = .6
largePoint = 0.4
legendPoint = 1.0

blackColor = '"#000000"'
lineColor1 = '"#91bfdb"'
lineColor2 = '"#fc8d59"'


set rmargin 0.3

# Arrows
top = 5
bottom = -17
text = -7
line = 'dt 4 lc "#000000"'
arrowColor = 'lc "#444444" lw 0.5'
arrowSize = 5
angle1 = 30
angle2 = 50

set arrow 1 from 45*2.78,bottom to 45*2.78,top @line nohead
set arrow 2 from 95*2.78,bottom to 95*2.78,top @line nohead

set arrow 3 from 115*2.78,bottom to 115*2.78,top @line nohead
set arrow 4 from 175*2.78,bottom to 175*2.78,top @line nohead

set arrow 5 from 45*2.78,text to 95*2.78,text size arrowSize,angle1,angle2 filled  heads @arrowColor
set arrow 6 from 115*2.78,text to 175*2.78,text size arrowSize,angle1,angle2 filled  heads @arrowColor

set label 1 'Amplifier' at 61*2.78,text+1.5
set label 2 'Amplifier' at 135*2.78,text+1.5

set key nobox reverse width -2

plot 'data.dat' using ($0*2.78):($2*0) with lines dt 3 lc @blackColor  notitle,\
	'' using ($0*2.78):1 with points pt 5 ps smallPoint lc @lineColor1 notitle,\
	'' using ($0*2.78):2 with points pt 5 ps smallPoint lc @lineColor2 notitle
	## '' using ($0*2.78):($2*10) with points pt 5 ps legendPoint lc @lineColor1 t 'AC',\
	## '' using ($0*2.78):($2*10) with points pt 5 ps legendPoint lc @lineColor2 t 'no AC'