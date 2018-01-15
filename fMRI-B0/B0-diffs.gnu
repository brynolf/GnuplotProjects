reset
set terminal epslatex standalone color size 20cm, 10cm font "cmr,9" 
set output 'B0-diffs.tex'
set multiplot

load 'moreland.pal'
unset border
unset tics
startpoint = 0.02
cbwidth = 0.1
sep = 0.02

set bmargin at screen 0.05
set tmargin at screen 0.9
width = (1-cbwidth-0.02)/2
set lmargin at screen startpoint
set rmargin at screen startpoint+width
set title '\Huge{B0 map 1}'
plot 'B0_1.png' binary filetype=png w rgbimage notitle

set title '\Huge{$\Delta$B0}'
set lmargin at screen startpoint+sep+width
set rmargin at screen startpoint+sep+2*width
plot 'dB0_1.png' binary filetype=png w rgbimage notitle


unset title
unset key

set cbrange [-75:75] 
set colorbox user size 0.03,.85 origin screen 0.93,0.05
set cbtics ("-75" -75, "0" 0, "75" 75)

set lmargin at screen 1.1
set rmargin at screen 1.3
set xrange [0:1]
## unset tics
plot x with points notitle lt palette
