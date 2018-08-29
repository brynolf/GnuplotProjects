reset
set terminal epslatex standalone color size 6cm, 8cm font "cmr,8" 
set output 'plot1-old.tex'
set datafile separator ","


tumortype = 'lipoma ALT liposarcoma'
datas = "PDFF CL UD PUD";
do for [i=1:words(tumortype)] {
file = word(tumortype,i).'.csv'
do for [index = 1:words(datas)] {
	stats file using 7 name word(tumortype,i).'_'.word(datas,index)
}
}

set xrange [0.5:3.5]
set yrange [0:100]

set ylabel 'PDFF \%'

set boxwidth .6 
set style fill solid border lc rgb "#000000"

set xtics 1,1,3
set title 'Fat fraction'
plot for [tum=1:3] for [var=1:4] '-' using (1):(word_lo_quartile):(A_min):(A_max):(A_up_quartile) with candlestick whiskerbars lc rgb "#BBBBBB" notitle,\
 '' using (1):7 with points pt 7 lc rgb "#343398" notitle,\
 'ALT.csv' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) with candlestick whiskerbars lc rgb "#BBBBBB" notitle,\
 '' using (2):7 with points pt 7 lc rgb "#FE9901" notitle,\
 'liposarcoma.csv' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) with candlestick whiskerbars lc rgb "#BBBBBB" notitle,\
 '' using (3):7 with points pt 7 lc rgb "#FE0000" notitle