reset
set terminal epslatex standalone color size 13cm, 20cm font "cmr,8" 
set output 'heatmap.tex'

## Set raneg of colorbar
set cbrange [-.7:.7]

## set logscale cb

					  
set xrange [ -0.5 : 18.5 ] noreverse nowriteback
set yrange [ 60.5 : -0.5 ] noreverse 


load 'moreland.pal'


set xtics rotate by 90 right offset character 0,0 \
(   'Autocorrelation' 0,\
    'Cluster prominence' 1,\
    'Cluster shade' 2,\
    'Contrast' 3,\
    'Correlation' 4,\
    'Difference entropy' 5,\
    'Difference variance' 6,\
  'Dissimilariy' 7,\
  'Energy' 8,\
  'Entropy' 9,\
  'Homogeneity' 10,\
  'Inf. Meas. Corr1.' 11,\
  'Inf. Meas. Corr2.' 12,\
  'Inverse difference' 13,\
  'Max. prob.' 14,\
  'Sum average' 15,\
  'Sum entropy' 16,\
  'Sum of squares' 17,\
  'Sum variance' 18)
	
set ytics right \
(	       'Freq. Res.\phantom)' 0,\
    'Phase Res.\phantom)' 1,\
    'GLCM Size\phantom)' 2,\
    'ADC(b: 0,1000)' 3,\
    'ADC(b: 0-1000)' 4,\
    'ADC(b: 200,1000)' 5,\
    'ADC(b: 200-1000)' 6,\
    'Thresh. (Manual)' 7,\
    'Thresh. (AutoROI)' 8,\
    'Thresh. (AutoSlice)' 9,\
    'Noise\phantom)' 10,\
    '(Freq. Res.)$^2$' 11,\
    '(Phase Res.)$^2$' 12,\
    '(GLCM Size)$^2$' 13,\
    '(Noise)$^2$' 14,\
    '(Phase Res.)$\times$(Freq. Res.)' 15,\
    '(GLCM Size)$\times$(Freq. Res.)' 16,\
    '(ADC(b: 0,1000))$\times$(Freq. Res.)' 17,\
    '(ADC(b: 0--1000))$\times$(Freq. Res.)' 18,\
    '(ADC(b: 200,1000))$\times$(Freq. Res.)' 19,\
    '(ADC(b: 200--1000))$\times$(Freq. Res.)' 20,\
    '(Thresh. (Manual))$\times$(Freq. Res.)' 21,\
    '(Thresh. (AutoROI))$\times$(Freq. Res.)' 22,\
    '(Thresh. (AutoSlice))$\times$(Freq. Res.)' 23,\
    '(Noise)$\times$(Freq. Res.)' 24,\
    '(GLCM Size)$\times$(Phase Res.)' 25,\
    '(ADC(b: 0,1000))$\times$(Phase Res.)' 26,\
    '(ADC(b: 0--1000))$\times$(Phase Res.)' 27,\
    '(ADC(b: 200,1000))$\times$(Phase Res.)' 28,\
    '(ADC(b: 200--1000))$\times$(Phase Res.)' 29,\
    '(Thresh. (Manual))$\times$(Phase Res.)' 30,\
    '(Thresh. (AutoROI))$\times$(Phase Res.)' 31,\
    '(Thresh. (AutoSlice))$\times$(Phase Res.)' 32,\
    '(Noise)$\times$(Phase Res.)' 33,\
    '(ADC(b: 0, 1000))$\times$(GLCM Size)' 34,\
    '(ADC(b: 0--1000))$\times$(GLCM Size)' 35,\
    '(ADC(b: 200, 1000))$\times$(GLCM Size)' 36,\
    '(ADC(b: 200--1000))$\times$(GLCM Size)' 37,\
    '(Thresh. (Manual))$\times$(GLCM Size)' 38,\
    '(Thresh. (AutoROI))$\times$(GLCM Size)' 39,\
    '(Thresh. (AutoSlice))$\times$(GLCM Size)' 40,\
    '(Noise)$\times$(GLCM Size)' 41,\
    'Thresh. (Manual)$\times$(ADC(b: 0, 1000))' 42,\
    '(Thresh. (AutoROI))$\times$(ADC(b: 0, 1000))' 43,\
    '(Thresh. (AutoSlice))$\times$(ADC(b: 0, 1000))' 44,\
    '(Thresh. (Manual))$\times$(ADC(b: 0--1000))' 45,\
    '(Thresh. (AutoROI))$\times$(ADC(b: 0--1000))' 46,\
    '(Thresh. (AutoSlice))$\times$(ADC(b: 0--1000))' 47,\
    '(Thresh. (Manual))$\times$(ADC(b: 200, 1000))' 48,\
    '(Thresh. (AutoROI))$\times$(ADC(b: 200, 1000))' 49,\
    '(Thresh. (AutoSlice))$\times$(ADC(b: 200, 1000))' 50,\
    '(Thresh. (Manual))$\times$(ADC(b: 200--1000))' 51,\
    '(Thresh. (AutoROI))$\times$(ADC(b: 200--1000))' 52,\
    '(Thresh. (AutoSlice))$\times$(ADC(b: 200--1000))' 53,\
    '(ADC(b: 0, 1000))$\times$(Noise)' 54,\
    '(ADC(b: 0--1000))$\times$(Noise)' 55,\
    '(ADC(b: 200, 1000))$\times$(Noise)' 56,\
    '(ADC(b: 200--1000))$\times$(Noise)' 57,\
    'Thresh. (Manual)$\times$(Noise)' 58,\
    '(Thresh. (AutoROI))$\times$(Noise)' 59,\
    '(Thresh. (AutoSlice))$\times$(Noise)' 60)


set tics front
set title 'MLR coefficients'

# GLCM Size

y = 3
x = 4
set arrow from x-1.5,y-1.5 to x+.5,y-1.5 front nohead
set arrow from x-1.5,y-.5 to x+.5,y-.5 front nohead
set arrow from x-1.5,y-.5 to x-1.5,y-1.5 front nohead
set arrow from x+0.5,y-.5 to x+.5,y-1.5 front nohead

y = 3
x = 10
set arrow from x-1.5,y-1.5 to x+.5,y-1.5 front nohead
set arrow from x-1.5,y-.5 to x+.5,y-.5 front nohead
set arrow from x-1.5,y-.5 to x-1.5,y-1.5 front nohead
set arrow from x+0.5,y-.5 to x+.5,y-1.5 front nohead

# Noise
y = 11
x = 4
set arrow from x-1.5,y-1.5 to x+.5,y-1.5 front nohead
set arrow from x-1.5,y-.5 to x+.5,y-.5 front nohead
set arrow from x-1.5,y-.5 to x-1.5,y-1.5 front nohead
set arrow from x+0.5,y-.5 to x+.5,y-1.5 front nohead

y = 11
x = 10
set arrow from x-1.5,y-1.5 to x+.5,y-1.5 front nohead
set arrow from x-1.5,y-.5 to x+.5,y-.5 front nohead
set arrow from x-1.5,y-.5 to x-1.5,y-1.5 front nohead
set arrow from x+0.5,y-.5 to x+.5,y-1.5 front nohead

# GLCM Size x Noise
y = 42
x = 4
set arrow from x-1.5,y-1.5 to x+.5,y-1.5 front nohead
set arrow from x-1.5,y-.5 to x+.5,y-.5 front nohead
set arrow from x-1.5,y-.5 to x-1.5,y-1.5 front nohead
set arrow from x+0.5,y-.5 to x+.5,y-1.5 front nohead

y = 42
x = 10
set arrow from x-1.5,y-1.5 to x+.5,y-1.5 front nohead
set arrow from x-1.5,y-.5 to x+.5,y-.5 front nohead
set arrow from x-1.5,y-.5 to x-1.5,y-1.5 front nohead
set arrow from x+0.5,y-.5 to x+.5,y-1.5 front nohead



set colorbox size 0.05,0.5

plot 'heatmap.bin' binary array=(19,61) format='%double' rotate=pi transpose flip=xy with image notitle