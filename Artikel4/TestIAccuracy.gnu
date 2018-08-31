reset
set terminal epslatex standalone color size 15cm, 8.5cm header \
"\\usepackage[bitstream-charter]{mathdesign}"
set output 'TestIAccuracy.tex'

set datafile separator ","
set multiplot 
set macros

lMargin = 0.1
rMargin = 0.02
mMargin = 0.02
tMargin = 0.2
bMargin = 0.15

graphWidth = (1-lMargin-rMargin-mMargin)/2
graphHeight = (1-tMargin-bMargin)

set xtics (  '\normalsize{8\phantom{1}}' 8,\
	'\normalsize{32}' 32,\
	'\normalsize{64}' 64,\
	'\normalsize{96}' 96,\
	'\normalsize{128}' 128,\
	'\normalsize{160}' 160,\
	'\normalsize{192}' 192,\
	'\normalsize{224}' 224,\
	'\normalsize{256}' 256)

styles1 = 'lt 1 lw 2 ps 1.5 lc rgb "#000000"'
styles2 = 'lt 1 lw 2 ps 1 lc rgb "#000000"'
set xrange [0:264]
set yrange [0.45:1]

set label 1 '\Large{Classifiers trained on multiple quantizations}' at screen 0.215,0.93

set ylabel 'Classification Accuracy' offset 1,0
set xlabel 'Test Data Quantization gray levels'
set key at graph 0.96,0.1 Left bottom invert width -5 samplen 2
set title 'MRI Brain data' offset 0,-.5
set lmargin at screen lMargin
set rmargin at screen lMargin+graphWidth
set bmargin at screen bMargin
set tmargin at screen 1-tMargin
set arrow 1 from 0, 0.5 to 264,0.5 dt 6 lc rgb "#000000" nohead
plot 'TestIBrainOrig.csv' using 1:2:3 with errorbars @styles1 pt 9 t 'Original Features',\
	'TestIBrainInv.csv' using 1:2:3 with errorbars @styles2 pt 5 t 'Invariant Features'

unset arrow 1
set key at graph 0.96,0.8 Left bottom invert width -5 samplen 2
set title 'Gland data'
unset ylabel
set ytics format " "
set lmargin at screen lMargin+graphWidth + mMargin
set rmargin at screen 1-rMargin
set bmargin at screen bMargin
set tmargin at screen 1-tMargin
set arrow 2 from 0, 0.615 to 264,0.615 dt 6 lc rgb "#000000" nohead
plot 'TestICellOrig.csv' using 1:2:3 with errorbars @styles1 pt 9 t 'Original Features',\
	'TestICellInv.csv' using 1:2:3 with errorbars @styles2 pt 5 t 'Invariant Features'
