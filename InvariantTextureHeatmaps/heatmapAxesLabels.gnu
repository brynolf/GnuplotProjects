## Set ranges
unset logscale y
unset y2tics
set xrange [ -0.5 : 15.5 ] noreverse nowriteback
set yrange [ 15.5 : -0.5 ] noreverse 
set ytics right \
(  '\large{8}' 0,\
	'\large{32}' 3,\
	'\large{64}' 7,\
	'\large{96}' 11,\
	'\large{128}' 15)
  ## '16' 1,\
  ## '24' 2,\
  
  ## '40' 4,\
  ## '48' 5,\
  ## '56' 6,\
  
  ## '72' 8,\
  ## '80' 9,\
  ## '88' 10,\
  
  ## '104' 12,\
  ## '112' 13,\
  ## '120' 14,\
  
set xtics rotate by 0 right offset character 1,0 \
(  '\large{8}' 0,\
	'\large{32}' 3,\
	'\large{64}' 7,\
	'\large{96}' 11,\
	'\large{128}' 15)
## (  '8' 0,\
  ## '16' 1,\
  ## '24' 2,\
  ## '32' 3,\
  ## '40' 4,\
  ## '48' 5,\
  ## '56' 6,\
  ## '64' 7,\
  ## '72' 8,\
  ## '80' 9,\
  ## '88' 10,\
  ## '96' 11,\
  ## '104' 12,\
  ## '112' 13,\
  ## '120' 14,\
  ## '128' 15)