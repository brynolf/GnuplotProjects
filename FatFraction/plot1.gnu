reset
set terminal epslatex standalone color size 5cm, 17cm font "cmr,8" 
set output 'plot1.tex'
set datafile separator ","

set multiplot layout 4,1
set macros
tumortype = 'lipoma ALT liposarcoma_bckp'
colors = "#343398 #FE9901 #FE0000"

datas = "PUD UD CL PDFF"
datasColumns = "PUD3_mode UD3_mode CL3_mode FF_mean_[%]"
## datasColumns = "FF_mean_[%]"

set xrange [0.5:3.5]
set xtics rotate by 90
set ytics nomirror format " "
set y2tics format "%g" rotate by 90

x11 = -5
x12 = 100
x21 = 15
x22 = 21.5
x31 = 1.5
x32 = 4
x41 = 0
x42 = 2

set boxwidth .6 
set style fill solid border lc rgb "#000000"

set xtics 1,1,3
set lmargin at screen 0.1
set rmargin at screen 0.9
set tmargin 0
do for [i=1:words(tumortype)] {
	file = word(tumortype,i).'.csv'
	do for [index = 1:words(datas)] {
		if (index==4) {set yrange [x11:x12]
			tf = "FF_mean_[%]"
			set tmargin 0
			unset bmargin
			unset ylabel
			set y2range [x11:x12]
			set xtics ('Lipoma' 1, 'ALT' 2, 'Liposarcoma' 3) rotate by 0 offset 0,0
			unset label 10
			unset label 11
			unset label 12
			unset label 13
			unset label 14
			if (i==3) {set y2tics ('20' 20,'40' 40,'60' 60, '80' 80) offset 0,-0.55 format "%g" rotate by 90 mirror
			set label 10 '0' at screen 0.957,0.04 rotate by 90
			set label 11 '100' at screen 0.957,0.238 rotate by 90
			set ylabel '\Large \textbf{ PDFF \%}' offset 2.5,0}
			else {set y2tics 0,20 offset 0,-0.4 format " "}
		}
		
		if (index==3) {set yrange [16:x22]
			tf = "CL3_mode"
			unset ylabel
			set y2range [16:x22]
			set my2tics 2
			unset label 10
			unset label 11
			unset label 12
			unset label 13
			unset label 14
			if (i==3) {set y2tics x21,2 offset 0,-0.6 format "%g" rotate by 90 mirror
			set ylabel '\Large \textbf{ CL}'  offset 2.5,0} 
			else {set y2tics x21,2 offset 0,-0.4 format " "}
		}
		
		if (index==2) {set yrange [x31:x32]
			tf = "UD3_mode"
			set tmargin 0
			unset ylabel
			set y2range [x31:x32]
			unset label 10
			unset label 11
			unset label 12
			unset label 13
			unset label 14
			if (i==3){set y2tics x31,0.5,3.5 offset 0,-0.65 format "%1.1f" rotate by 90 mirror
			set ylabel '\Large \textbf{ UD}' offset 2.5,0
			set label 14 '4' at screen 0.9558,0.745 rotate by 90}
			else {set y2tics x31,0.5 offset 0,-0.4 format " "}
		}
		
		if (index==1) {set yrange [x41:x42]
			tf = "PUD3_mode"
		    set bmargin 1
			set tmargin 0.5
			unset ylabel
			set y2range [x41:x42]
			unset label 12
			unset label 10
			unset label 11
			unset label 13
			unset label 14
			if (i==3) {set y2tics 0.5, 0.5,1.5 offset 0,-0.65 format "%1.1f" rotate by 90 mirror
			set label 12 '0' at screen 0.9558,0.765 rotate by 90
			set label 13 '2' at screen 0.9558,0.985 rotate by 90
			set ylabel '\Large \textbf{ PUD}' offset 2.5,0}
			else {set y2tics x41, 0.5 offset 0,-0.4 format " " }
			set xtics (' ' 1, ' ' 2, ' ' 3) offset 0,-2
		}
		
		## stats file using word(datasColumns,index) name 'A'
		stats file using tf name 'A'
		plot file using (i):(A_lo_quartile):(A_min):(A_max):(A_up_quartile) with candlestick whiskerbars lc rgb "#BBBBBB" notitle,\
		file using (i):word(datasColumns,index) with points pt 7 lc rgb word(colors,i) notitle
}
}


## for [tum=1:1] for [var=1:1] 
## plot 'lipoma.csv' using (1):(50):(40):(@test):(70) with candlestick whiskerbars lc rgb "#BBBBBB" notitle

## plot 'lipoma.csv' using (2):(@lowV):(@minV):(@maxV):(@highV) with candlestick whiskerbars lc rgb "#BBBBBB" notitle

## plot 'lipoma.csv' using (1):(lipoma_PDFF_lo_quartile):(lipoma_PDFF_min):(lipoma_PDFF_max):(lipoma_PDFF_up_quartile) with candlestick whiskerbars lc rgb "#BBBBBB" notitle
## plot 'lipoma.csv' using (1):(word(tumortype,1).word(datas,1).'_lo_quartile'):(word(tumortype,1).word(datas,1).'_min'):(word(tumortype,1).word(datas,1).'_max'):(word(tumortype,1).word(datas,1).'_up_quartile') with candlestick whiskerbars lc rgb "#BBBBBB" notitle


 ## '' using (1):7 with points pt 7 lc rgb "#343398" notitle,\
 ## 'ALT.csv' using (2):(B_lo_quartile):(B_min):(B_max):(B_up_quartile) with candlestick whiskerbars lc rgb "#BBBBBB" notitle,\
 ## '' using (2):7 with points pt 7 lc rgb "#FE9901" notitle,\
 ## 'liposarcoma.csv' using (3):(C_lo_quartile):(C_min):(C_max):(C_up_quartile) with candlestick whiskerbars lc rgb "#BBBBBB" notitle,\
 ## '' using (3):7 with points pt 7 lc rgb "#FE0000" notitle