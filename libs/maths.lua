--  lua-users.org/wiki/MathLibraryTutorial
--  www.tutorialspoint.com/lua/lua_standard_libraries_math_library.htm
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  absolute, non-negative value
abs  = math.abs
--  abs( -100 )   ;   = 100

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  inverse (arc) sine in radians
asin  = math.asin
--  asin( 0 )   ;   = 0
--  asin( 1 )   ;   = 1.5707963267949

--  inverse (arc) cosine in radians
acos  = math.acos
--  acos( 1 )   ;   = 0
--  acos( 0 )   ;   = 1.5707963267949

--  inverse (arc) tangent in radians,  range( -pi /2,  pi /2 )
atan  = math.atan -- ( y / x )
--  c, s  = cos( 0.8 ),  sin( 0.8 )
--  atan( s/c )    ;   = 0.8

--  angle of line from (0, 0) to (x, y) in radians,  range( -pi,  pi )
atan2  = math.atan2 -- ( y, x )  two args required,  returns signed quads
--  atan2( s, c )   ;   = 0.8

--  pi /4            ;   =  0.78539816339745
--  atan( 1 )        ;   =  0.78539816339745
--  atan( -1 )       ;   = -0.78539816339745

--  atan2( 1, 1 )    ;   =  0.78539816339745  quadrant I    top-right
--  atan2( -1, 1 )   ;   = -0.78539816339745  quadrant II   top-left
--  atan2( -1, -1 )  ;   = -2.3561944901923   quadrant III  bottom-left
--  atan2( 1, -1 )   ;   =  2.3561944901923   quadrant IV   bottom-right
--  3 *pi /4         ;   =  2.3561944901923

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  integer, no less/greater than given value
ceil  = math.ceil
--  ceil( 0.5 )    ;   = 1
--  ceil( -0.5 )   ;   = -0

floor  = math.floor
--  floor( 0.5 )    ;   = 0
--  floor( -0.5 )   ;   = -1

function round( number )
  return floor( number +0.5 )
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  cosine, sine and tangent for given value in radians.
sin  = math.sin   -- sine wave                        _-_
--  sin( 0 )       ;   = 0                     \     /   \     /
--  sin( pi /4 )   ;   = 0.70710678118655       \   /     \   /
--  sin( 1 )       ;   = 0.8414709848079         `-'       `-'

--  complementary sine wave,  π/2 radians out of phase
cos  = math.cos    --                          _-_       _-_
--  cos( 0 )       ;   = 1                        \     /   \
--  cos( pi /4 )   ;   = 0.70710678118655          \   /     \
--  cos( 1 )       ;   = 0.54030230586814           `-'       `-'

--  line that touches the circle                    /
tan  = math.tan    --                              /--_
--  tan( 0 )       ;   = 0                        /    \
--  tan( pi /4 )   ;   = 1                       /\    /
--  tan( 1 )       ;   = 1.5574077246549        /  `--'


--  hyperbolic variations, returns radians.   y = func(x)
cosh  = math.cosh
--  cosh( 0 )       ;   = 1                       \/
--  cosh( pi /2 )   ;   = 2.5091784786581         U
--  cosh( 1 )       ;   = 1.5430806348152
sinh  = math.sinh   --                            |
--  sinh( 0 )       ;   = 0                      /
--  sinh( pi /2 )   ;   = 2.3012989023073       /
--  sinh( 1 )       ;   = 1.1752011936438      |
tanh  = math.tanh
--  tanh( -16.807 )   ;   = -1                 ___
--  tanh( 0 )         ;   = 0                 /
--  tanh( 16.807 )    ;   = 1             ---'

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  Convert radians to degrees and vice versa. 
deg  = math.deg
--  deg( math.pi )      ;   = 180
--  deg( math.pi / 2 )   ;   = 90
rad  = math.rad
--  rad( 180 )   ;   = 3.1415926535898
--  rad( 1 )    ;   = 0.017453292519943

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- e (base of natural logarithms) raised to power of value given
exp  = math.exp
--  exp( 0 )    ;   = 1
--  exp( 1 )    ;   = 2.718281828459  = e
--  exp( 27 )   ;   = 532048240601.8

log  = math.log  --   inverse of math.exp
--  log( 532048240601 )   ;   = 26.999999999998
--  log( 3 )              ;   = 1.0986122886681
--  log( -3 )             ;   = nan

log10  = math.log10  --  base-10 logs
--  log10( 1000 )    ;   = 3
--  log10( -1000 )    ;   = nan
--  log10( 1000000 )   ;   = 6

--  returns x^y
pow  = math.pow
--  pow( 2, 10 )   ;   1024
--  2 ^ 10         ;   1024

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  manipulate floats without direct bit manipulation
--  Returns normalized fraction (mantissa) & exponent.  x = m2e
frexp  = math.frexp
--  frexp( 5 )   ;   0.625   3
--  frexp( 9 )   ;   0.5625   4
--  frexp( 1024 )   ;   0.5   11
--  e  = int  and  abs(m) is range(  0.5(inclusive),  1(exclusive)  )
--                        ...or zero if x = zero

--  Returns m2e (e = integer)
ldexp  = math.ldexp
--  ldexp( 1, 9 )       ;   512
--  ldexp( 1, 10 )       ;   1024
--  ldexp( 1000000, 1 )   ;   2000000

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  minimum or maximum value from variable length list of args.
min  = math.min
--  min( 1,  2 )          ;   = 1
--  min( 1.2,  7,  3 )    ;   = 1.2
--  min( 1.2,  -7,  3 )   ;   = -7
max  = math.max
--  max( 1.2,  -7,  3 )   ;   = 3
--  max( 1.2,  7,  3 )    ;   = 7

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  floating-point remainder of x / y.  rounds towards zero
mod,  fmod  = math.fmod,  math.fmod
--  fmod( 9.5,  -3.5 )   ;   -2.5
--  fmod( -9.5,  3.5 )   ;   2.5
--  fmod( 9.5,  0 )      ;   -nan

--  for modulus (remainder) use modulo % operator instead.  rounds to -inf
--  9.5 % -3.5   ;   1
--  -9.5 % 3.5   ;   -1
--  -9.5 % 0     ;   -nan

--  integral and fractional parts,  splits @ decimal point
modf  = math.modf
--  modf( 5 )      ;   = 5    0
--  modf( 5.3 )    ;   = 5    0.3
--  modf( -5.3 )   ;   = -5    -0.3

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  square root of given number.  Only non-negative args allowed
sqrt  = math.sqrt
--  sqrt( 100 )    ;   = 10
--  sqrt( 1234 )   ;   = 35.128336140501
--  sqrt( -7 )     ;   = -nan

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  generate pseudo-random numbers uniformly distributed
random  = math.random
--  random() no args = real number between 0 and 1.
--  random( upper )  = integers between 1 & upper (both inclusive).
--  random( lower, upper ) ints between lower & upper (inclusive)

--  random()   ;   = 0.0012512588885159
--  random()   ;   = 0.56358531449324
--  random( 100 )   ;   = 20
--  random( 100 )   ;   = 81
--  random( 70, 80 )   ;   = 76
--  random( 70, 80 )   ;   = 75
--  upper and lower MUST be integer, else unexpected results


--  seed for pseudo-random gen:  Equal seeds produce equal sequences
randomseed  = math.randomseed
--  randomseed( 1234 );  random(), random(), random()
--  0.12414929654836        0.0065004425183874      0.3894466994232
--  randomseed( 1234 );  random(), random(), random()
--  0.12414929654836        0.0065004425183874      0.3894466994232

--  good* 'seed' is os.clock(),  wait a second before calling again.
--  first number not really 'random' (Win 2K & OS X)
--  roll the dice a couple times to prime them.

--  randomseed( os.clock() );  random(), random(), random()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  represents +infinity. 
huge  = math.huge
--  huge       ;   = inf
--  huge / 2    ;   = inf
--  -huge       ;   = -inf
--  huge/huge    ;   = nan
--  huge * 0     ;   = nan
--  1/0           ;   = inf
--  1/0 == huge   ;   = true
--  huge == huge   ;   = true

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  constant Pi, and portions thereof
pi         = math .pi
quarterpi  = pi *0.25
halfpi     = pi *0.5
threeqpi   = pi *0.75
tau        = pi *2

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--[[
math.maxinteger
math.mininteger
math.tointeger
math.type
math.ult
]]
