reset
set terminal cairolatex pdf colortext standalone fontscale 4 background rgb 'black' size 13 cm , 7.8 cm
set output 'SNR.tex'

## Set multiplot
set multiplot

unset tics 
## unset border
unset key
## set size ratio 0.9 
vtop = 0.01
vbot = 0.01
vmid = 0.0
hleft = 0.01
hmid = 0.0
hright = 0.01
imw = (1- hleft - 2*hmid - hright)/3
imh = (1-vtop - vmid - vbot)/2
labelPosX = 0.39
labelPosY = 0.01

## set lmargin 
lm = hleft
vm = imh+vmid+vbot
set lmargin at screen lm
set rmargin at screen hleft+imw
set tmargin at screen 2*imh+vmid+vbot
set bmargin at screen vm
set label '\large ROI 1' at graph labelPosX,labelPosY tc rgb "#FFFFFF" front  
## set xlabel 'ROI 1' 
plot 'SNR1New.png' binary filetype=png w rgbimage

unset label
lm = hleft + hmid + imw
set lmargin at screen hleft + hmid + imw
set rmargin at screen hleft + hmid + 2*imw
set tmargin at screen 2*imh+vmid+vbot
set bmargin at screen vm
set label '\large ROI 2' at graph labelPosX,labelPosY tc rgb "#FFFFFF" front  
plot 'SNR2New.png' binary filetype=png w rgbimage

unset label
lm = hleft + 2*hmid + 2*imw
set lmargin at screen hleft + 2*hmid + 2*imw
set rmargin at screen hleft + 2*hmid + 3*imw
set tmargin at screen 2*imh+vmid+vbot
set bmargin at screen vm
set label '\large ROI 3' at graph labelPosX,labelPosY tc rgb "#FFFFFF" front  
plot 'SNR3New.png' binary filetype=png w rgbimage

unset label
lm = hleft
set lmargin at screen lm
set rmargin at screen hleft+imw
set tmargin at screen imh+vbot
set bmargin at screen vbot
set label '\large ROI 4' at graph labelPosX,labelPosY tc rgb "#FFFFFF" front  
plot 'SNR4New.png' binary filetype=png w rgbimage

unset label
lm = hleft + hmid + imw
set lmargin at screen lm
set rmargin at screen hleft + hmid + 2*imw
set tmargin at screen imh+vbot
set bmargin at screen vbot
set label '\large ROI 5' at graph labelPosX,labelPosY tc rgb "#FFFFFF" front  
plot 'SNR5New.png' binary filetype=png w rgbimage

unset label
lm = hleft + 2*hmid + 2*imw
set lmargin at screen lm
set rmargin at screen hleft + 2*hmid + 3*imw
set tmargin at screen imh+vbot
set bmargin at screen vbot
set label '\large ROI 6' at graph labelPosX,labelPosY tc rgb "#FFFFFF" front  
plot 'SNR6New.png' binary filetype=png w rgbimage