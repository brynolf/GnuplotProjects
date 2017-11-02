reset
set terminal epslatex standalone color size 8cm, 4cm font "cmr,8" 
set output 'trend.tex'
set xrange [1980:2015]
set ytics 20
set xtics 10
set title ' \footnotesize "texture analysis" AND (cancer or tumor or tumour or neoplasm) '
set ylabel '\# published papers'
set xlabel 'Year'
plot 'data4.dat' using 2:1 with lines notitle lc rgb "#000000"