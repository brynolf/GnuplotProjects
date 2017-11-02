reset
set terminal epslatex standalone color size 13cm, 15cm font "cmr,8" 
set output 'heatmap5FactorsNormalized.tex'

## Set raneg of colorbar
set cbrange [-.7:.7]

## set logscale cb

					  
set xrange [ -0.5 : 18.5 ] noreverse nowriteback
set yrange [ 48.5 : -0.5 ] noreverse 


set palette defined(\
0       0.2314  0.2980  0.7529,\
0.03125 0.2667  0.3529  0.8000,\
0.0625  0.3020  0.4078  0.8431,\
0.09375 0.3412  0.4588  0.8824,\
0.125   0.3843  0.5098  0.9176,\
0.15625 0.4235  0.5569  0.9451,\
0.1875  0.4667  0.6039  0.9686,\
0.21875 0.5098  0.6471  0.9843,\
0.25    0.5529  0.6902  0.9961,\
0.28125 0.5961  0.7255  1.0000,\
0.3125  0.6392  0.7608  1.0000,\
0.34375 0.6824  0.7882  0.9922,\
0.375   0.7216  0.8157  0.9765,\
0.40625 0.7608  0.8353  0.9569,\
0.4375  0.8000  0.8510  0.9333,\
0.46875 0.8353  0.8588  0.9020,\
0.5     0.8667  0.8667  0.8667,\
0.53125 0.8980  0.8471  0.8196,\
0.5625  0.9255  0.8275  0.7725,\
0.59375 0.9451  0.8000  0.7255,\
0.625   0.9608  0.7686  0.6784,\
0.65625 0.9686  0.7333  0.6275,\
0.6875  0.9686  0.6941  0.5804,\
0.71875 0.9686  0.6510  0.5294,\
0.75    0.9569  0.6039  0.4824,\
0.78125 0.9451  0.5529  0.4353,\
0.8125  0.9255  0.4980  0.3882,\
0.84375 0.8980  0.4392  0.3451,\
0.875   0.8706  0.3765  0.3020,\
0.90625 0.8353  0.3137  0.2588,\
0.9375  0.7961  0.2431  0.2196,\
0.96875 0.7529  0.1569  0.1843,\
1       0.7059  0.0157  0.1490\
)


set xtics rotate by 90 right offset character 0,0 \
('\footnotesize Autocorrelation' 0,\
 '\footnotesize Cluster prominence' 1,\
 '\footnotesize Cluster shade' 2,\
 '\footnotesize Contrast' 3,\
 '\footnotesize Correlation' 4,\
 '\footnotesize Difference entropy' 5,\
 '\footnotesize Difference variance' 6,\
'\footnotesize Dissimilariy' 7,\
'\footnotesize Energy' 8,\
'\footnotesize Entropy' 9,\
'\footnotesize Homogeneity' 10,\
'\footnotesize Inf. Meas. Corr1.' 11,\
'\footnotesize Inf. Meas. Corr2.' 12,\
'\footnotesize Inverse difference' 13,\
'\footnotesize Max. prob.' 14,\
'\footnotesize Sum average' 15,\
'\footnotesize Sum entropy' 16,\
'\footnotesize Sum of squares' 17,\
'\footnotesize Sum variance' 18)
	
set ytics right \
(	 '\footnotesize Resolution\phantom)' 0,\
 '\footnotesize GLCM Size\phantom)' 1,\
 '\footnotesize ADC(b: 0,1000)' 2,\
 '\footnotesize ADC(b: 0-1000)' 3,\
 '\footnotesize ADC(b: 200,1000)' 4,\
 '\footnotesize ADC(b: 200-1000)' 5,\
 '\footnotesize Thresh. (Manual)' 6,\
 '\footnotesize Thresh. (AutoROI)' 7,\
 '\footnotesize Thresh. (AutoSlice)' 8,\
 '\footnotesize Noise\phantom)' 9,\
 '\footnotesize (Resolution)$^2$' 10,\
 '\footnotesize (GLCM Size)$^2$' 11,\
 '\footnotesize (Noise)$^2$' 12,\
 '\footnotesize (Resolution)$\times$(Freq. Res.)' 13,\
 '\footnotesize (ADC(b: 0,1000))$\times$(Resolution)' 14,\
 '\footnotesize (ADC(b: 0-1000))$\times$(Resolution)' 15,\
 '\footnotesize (ADC(b: 200,1000))$\times$(Resolution)' 16,\
 '\footnotesize (ADC(b: 200-1000))$\times$(Resolution)' 17,\
 '\footnotesize (Thresh. (Manual))$\times$(Resolution)' 18,\
 '\footnotesize (Thresh. (AutoROI))$\times$(Resolution)' 19,\
 '\footnotesize (Thresh. (AutoSlice))$\times$(Resolution)' 20,\
 '\footnotesize (Noise)$\times$(Resolution)' 21,\
 '\footnotesize (ADC(b: 0, 1000))$\times$(GLCM Size)' 22,\
 '\footnotesize (ADC(b: 0-1000))$\times$(GLCM Size)' 23,\
 '\footnotesize (ADC(b: 200, 1000))$\times$(GLCM Size)' 24,\
 '\footnotesize (ADC(b: 200-1000))$\times$(GLCM Size)' 25,\
 '\footnotesize (Thresh. (Manual))$\times$(GLCM Size)' 26,\
 '\footnotesize (Thresh. (AutoROI))$\times$(GLCM Size)' 27,\
 '\footnotesize (Thresh. (AutoSlice))$\times$(GLCM Size)' 28,\
 '\footnotesize (Noise)$\times$(GLCM Size)' 29,\
 '\footnotesize Thresh. (Manual)$\times$(ADC(b: 0, 1000))' 30,\
 '\footnotesize (Thresh. (AutoROI))$\times$(ADC(b: 0, 1000))' 31,\
 '\footnotesize (Thresh. (AutoSlice))$\times$(ADC(b: 0, 1000))' 32,\
 '\footnotesize (Thresh. (Manual))$\times$(ADC(b: 0-1000))' 33,\
 '\footnotesize (Thresh. (AutoROI))$\times$(ADC(b: 0-1000))' 34,\
 '\footnotesize (Thresh. (AutoSlice))$\times$(ADC(b: 0-1000))' 35,\
 '\footnotesize (Thresh. (Manual))$\times$(ADC(b: 200, 1000))' 36,\
 '\footnotesize (Thresh. (AutoROI))$\times$(ADC(b: 200, 1000))' 37,\
 '\footnotesize (Thresh. (AutoSlice))$\times$(ADC(b: 200, 1000))' 38,\
 '\footnotesize (Thresh. (Manual))$\times$(ADC(b: 200-1000))' 39,\
 '\footnotesize (Thresh. (AutoROI))$\times$(ADC(b: 200-1000))' 40,\
 '\footnotesize (Thresh. (AutoSlice))$\times$(ADC(b: 200-1000))' 41,\
 '\footnotesize (ADC(b: 0, 1000))$\times$(Noise)' 42,\
 '\footnotesize (ADC(b: 0-1000))$\times$(Noise)' 43,\
 '\footnotesize (ADC(b: 200, 1000))$\times$(Noise)' 44,\
 '\footnotesize (ADC(b: 200-1000))$\times$(Noise)' 45,\
 '\footnotesize Thresh. (Manual)$\times$(Noise)' 46,\
 '\footnotesize (Thresh. (AutoROI))$\times$(Noise)' 47,\
 '\footnotesize (Thresh. (AutoSlice))$\times$(Noise)' 48,\
)


set tics front
set title 'MLR coefficients, Normalized Haralick features'

# GLCM Size

y = 2
x = 4
set arrow from x-1.5,y-1.5 to x+.5,y-1.5 front nohead
set arrow from x-1.5,y-.5 to x+.5,y-.5 front nohead
set arrow from x-1.5,y-.5 to x-1.5,y-1.5 front nohead
set arrow from x+0.5,y-.5 to x+.5,y-1.5 front nohead

y = 2
x = 10
set arrow from x-1.5,y-1.5 to x+.5,y-1.5 front nohead
set arrow from x-1.5,y-.5 to x+.5,y-.5 front nohead
set arrow from x-1.5,y-.5 to x-1.5,y-1.5 front nohead
set arrow from x+0.5,y-.5 to x+.5,y-1.5 front nohead

# Noise
y = 10
x = 4
set arrow from x-1.5,y-1.5 to x+.5,y-1.5 front nohead
set arrow from x-1.5,y-.5 to x+.5,y-.5 front nohead
set arrow from x-1.5,y-.5 to x-1.5,y-1.5 front nohead
set arrow from x+0.5,y-.5 to x+.5,y-1.5 front nohead

y = 10
x = 10
set arrow from x-1.5,y-1.5 to x+.5,y-1.5 front nohead
set arrow from x-1.5,y-.5 to x+.5,y-.5 front nohead
set arrow from x-1.5,y-.5 to x-1.5,y-1.5 front nohead
set arrow from x+0.5,y-.5 to x+.5,y-1.5 front nohead

## # GLCM Size x Noise
## y = 30
## x = 4
## set arrow from x-1.5,y-1.5 to x+.5,y-1.5 front nohead
## set arrow from x-1.5,y-.5 to x+.5,y-.5 front nohead
## set arrow from x-1.5,y-.5 to x-1.5,y-1.5 front nohead
## set arrow from x+0.5,y-.5 to x+.5,y-1.5 front nohead

## y = 30
## x = 10
## set arrow from x-1.5,y-1.5 to x+.5,y-1.5 front nohead
## set arrow from x-1.5,y-.5 to x+.5,y-.5 front nohead
## set arrow from x-1.5,y-.5 to x-1.5,y-1.5 front nohead
## set arrow from x+0.5,y-.5 to x+.5,y-1.5 front nohead



set colorbox size 0.05,0.5

plot 'heatmap_Coefficients_normalized.bin' binary array=(19,49) format='%double' rotate=pi transpose flip=xy with image notitle