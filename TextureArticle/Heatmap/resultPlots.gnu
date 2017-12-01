reset
set terminal epslatex standalone color size 10cm, 10cm font "cmr,8" 
set output 'resultPlots.tex'

## Set raneg of colorbar
set cbrange [-1.5:1.5]

## set logscale cb

					  
set xrange [ -0.5 : 3.5 ] noreverse nowriteback
set yrange [ 15.5 : -0.5 ] noreverse 


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


set xtics rotate by 45 right offset character 0,0 \
(   'Contrast' 0,\
    'Correlation' 1,\
    'Entropy' 2,\
    'Homogeneity' 3)
	
set ytics right \
(	'GLCM Size\phantom{)}'	0,\
    '(GLCM Size)$^2$'	1,\
    'Noise\phantom{)}'	2,\
    '(Noise)(Auto-Slice)'	15,\
    '(GLCM Size)(Auto-Slice)'	14,\
    '(Noise)(Manual Window)'	9,\
    'AutoROI\phantom{)}' 	13,\
	'(GLCM Size)(AutoROI)' 11,\
	'(GLCM Size)(Noise)' 3,\
    '(Phase res.)(Manual Window)'	6,\
    '(Freq. res.)(Manual Window)'	7,\
    'Manual Window\phantom{)}'	10,\
    '(Noise)(AutoROI)'	12,\
    '(GLCM Size)(Manual Window)'	8,\
	'(Phase res.)(Noise)' 4,\
    '(Freq. res.)(Noise)' 5)

set tics front
set title 'MLR coefficients'

## y = 0.5
## x = -0.5
## set arrow from x,y-1 to x+2,y-1 front nohead
## set arrow from x,y to x+2,y front nohead
## set arrow from x,y to x,y-1 front nohead
## set arrow from x+2,y to x+2,y-1 front nohead

## y = 2.5
## set arrow from x,y-1 to x+2,y-1 front nohead
## set arrow from x,y to x+2,y front nohead
## set arrow from x,y to x,y-1 front nohead
## set arrow from x+2,y to x+2,y-1 front nohead

## y = 3.5
## set arrow from x,y-1 to x+2,y-1 front nohead
## set arrow from x,y to x+2,y front nohead
## set arrow from x,y to x,y-1 front nohead
## set arrow from x+2,y to x+2,y-1 front nohead

## y = 5.5
## set arrow from x,y-1 to x+2,y-1 front nohead
## set arrow from x,y to x+2,y front nohead
## set arrow from x,y to x,y-1 front nohead
## set arrow from x+2,y to x+2,y-1 front nohead


## y = 0.5
## x = 1.5
## set arrow from x,y-1 to x+2,y-1 front nohead
## set arrow from x,y to x+2,y front nohead
## set arrow from x,y to x,y-1 front nohead
## set arrow from x+2,y to x+2,y-1 front nohead


## y = 2.5
## set arrow from x,y-1 to x+2,y-1 front nohead
## set arrow from x,y to x+2,y front nohead
## set arrow from x,y to x,y-1 front nohead
## set arrow from x+2,y to x+2,y-1 front nohead


## y = 3.5
## set arrow from x,y-1 to x+2,y-1 front nohead
## set arrow from x,y to x+2,y front nohead
## set arrow from x,y to x,y-1 front nohead
## set arrow from x+2,y to x+2,y-1 front nohead


## y = 5.5
## set arrow from x,y-1 to x+2,y-1 front nohead
## set arrow from x,y to x+2,y front nohead
## set arrow from x,y to x,y-1 front nohead
## set arrow from x+2,y to x+2,y-1 front nohead

set colorbox  size 0.05,0.5

plot 'resultplot.bin' binary array=(4,16) format='%double' rotate=pi transpose flip=xy with image notitle