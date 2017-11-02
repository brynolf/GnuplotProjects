reset
set terminal epslatex standalone color size 13cm, 10cm font "cmr,8" 
set output 'testLoadPath.tex'

load 'moreland.pal'

# Bessel functions (after Bronstein 2001, eq. 9.54a)
besj2(x) = 2*1/x * besj1(x) - besj0(x)
besj3(x) = 2*2/x * besj2(x) - besj1(x)
besj4(x) = 2*3/x * besj3(x) - besj2(x)
besj5(x) = 2*4/x * besj4(x) - besj3(x)
besj6(x) = 2*5/x * besj5(x) - besj4(x)
besj0_(x) = x<5 ? besj0(x) : 1/0


plot besj0(x) ls 1 lw 2, \
     besj1(x) ls 2 lw 2, \
     besj2(x) ls 3 lw 2, \
     besj3(x) ls 4 lw 2, \
     besj4(x) ls 5 lw 2, \
     besj5(x) ls 6 lw 2, \
     besj6(x) ls 7 lw 2