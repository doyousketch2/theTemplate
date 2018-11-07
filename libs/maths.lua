
--  love2d.org/wiki/General_math
--  love2d.org/wiki/Category:Snippets
--  lua-users.org/wiki/MathLibraryTutorial
--  www.tutorialspoint.com/lua/lua_standard_libraries_math_library.htm
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  if any of my functs differ from other online examples,
--  it's because I've tested them for speed, and chose the fastest.

--  if you happen to know any faster, you're welcome to mention it,
--[[  but I'll need proof:

iter  = 2000000
--  spin wheels for a second, to be sure functions are loaded and ready
for i = 1, 20 do example_function_1(i)  end
for i = 1, 20 do example_function_2(i)  end

init  = os.clock
for i = 1, iter do  example_function_1(i)  end
print( '1' ..os.clock -init )

init  = os.clock
for i = 1, iter do  example_function_2(i)  end
print( '2' ..os.clock -init )

]]--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  absolute, non-negative value
abs  = math.abs
--  abs( -100 )   ;   = 100

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Inverse trigonometric functions

--  arc sine in radians                      |
asin  = math.asin   --                      /
--  asin( 0 )   ;   =  0                   /
--  asin( 1 )   ;   =  1.5707963267949    /
--  pi /2       ;   =  1.5707963267949   /
--  asin( -1 )  ;   = -1.5707963267949  |


--  arc cosine in radians               |
acos  = math.acos   --                   \
--  acos( 1 )   ;   = 0                   \
--  acos( 0 )   ;   = 1.5707963267949      \
--  acos( -1 )  ;   = 3.1415926535898       \
--  pi          ;   = 3.1415926535898        |


--  arc tangent in radians,  range( -pi /2,  pi /2 )
atan  = math.atan -- ( y / x )               ,----
--  c, s  = cos( 0.8 ),  sin( 0.8 )         /
--  atan( s/c )     ;   = 0.8          ----'


--  angle of line from (0, 0) to (x, y) in radians,  range( -pi,  pi )
atan2  = math.atan2 -- ( y, x )  two args required,  returns signed quads
--  atan2( s, c )    ;   = 0.8

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

function round( num )
  return floor( num +0.5 )
end -- round()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  cosine, sine and tangent for given value in radians.
sin  = math.sin   -- sine wave                        .-.
--  sin( 0 )       ;   = 0                     \     /   \     /
--  sin( pi /4 )   ;   = 0.70710678118655       \   /     \   /
--  sin( 1 )       ;   = 0.8414709848079         `-'       `-'


--  complementary sine wave,  90° out of phase,  π /2 radians
cos  = math.cos    --                          .-.       .-.
--  cos( 0 )       ;   = 1                        \     /   \
--  cos( pi /4 )   ;   = 0.70710678118655          \   /     \
--  cos( 1 )       ;   = 0.54030230586814           `-'       `-'


--  line that touches the circle                    /
tan  = math.tan    --                              /--.
--  tan( 0 )       ;   = 0                        /    \
--  tan( pi /4 )   ;   = 1                       /\    /
--  tan( 1 )       ;   = 1.5574077246549        /  `--'


--  hyperbolic variations, returns radians.   y = func(x)
cosh  = math.cosh
--  cosh( 0 )       ;   = 1                    \      /
--  cosh( pi /2 )   ;   = 2.5091784786581       \    /
--  cosh( 1 )       ;   = 1.5430806348152        `--'


sinh  = math.sinh   --                            |
--  sinh( 0 )       ;   = 0                      /
--  sinh( pi /2 )   ;   = 2.3012989023073       /
--  sinh( 1 )       ;   = 1.1752011936438      |


tanh  = math.tanh
--  tanh( -16.807 )   ;   = -1                 ,----
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

log  = math.log -- (x [, base])   inverse of math.exp,  optional base
--  log( 532048240601 )   ;   = 26.999999999998
--  log( 2 )              ;   = 0.69314718055995
--  log( 2, 2 )           ;   = 1
--  log( -2 )             ;   = nan
--  log( 1000, 10 )       ;   = 3

log10  = math.log10  --  base-10 logs.  faster than log(x, 10)
--  log10( 1000 )    ;   = 3
--  log10( -1000 )    ;   = nan
--  log10( 1000000 )   ;   = 6

--  returns x^y
pow  = math.pow
--  pow( 2, 10 )   ;   = 1024
--  2 ^ 10         ;   = 1024  -- fractionally faster

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  manipulate floats without direct bit manipulation
--  Returns normalized fraction (mantissa) & integer exponent.
frexp  = math.frexp -- (x)  = m2e
--  frexp( 5 )   ;   = 0.625   3
--  frexp( 9 )   ;   = 0.5625   4
--  frexp( 1024 )   ;   = 0.5   11
--  abs(m) is range(  0.5(inclusive),  1(exclusive)  )
--                 ...or zero if x = zero

--  m2e (exponent = integer)
ldexp  = math.ldexp
--  ldexp( 1, 9 )       ;   = 512
--  ldexp( 1, 10 )       ;   = 1024
--  ldexp( 1000000, 1 )   ;   = 2000000

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  minimum or maximum value from variable length list of args.
min  = math.min -- (x, ···)
--  min( 1,  2 )          ;   = 1
--  min( 1.2,  7,  3 )    ;   = 1.2
--  min( 1.2,  -7,  3 )   ;   = -7

max  = math.max -- (x, ···)
--  max( 1.2,  -7,  3 )   ;   = 3
--  max( 1.2,  7,  3 )    ;   = 7

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  floating-point remainder of x / y.  rounds towards zero
fmod  = math.fmod -- (x, y)
--  fmod( 9.5,  -3.5 )   ;   -2.5
--  fmod( -9.5,  3.5 )   ;   2.5
--  fmod( 9.5,  0 )      ;   -nan

--  mod  = math.mod  -- deprecated in Lua, don't use
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

--  generate pseudo-random numbers, uniformly distributed
random  = math.random -- ([m [, n]])
--  random() no args = real number between 0 and 1.
--  random( upper )  = integers between 1 & upper (both inclusive).
--  random( lower, upper ) ints between lower & upper (inclusive)

--  random()     ;   = 0.56358531449324
--  random( 1 )   ;   = 1  no room between 1 and 1,  will always return 1
--  random( 2 )     ;   = 1  use 2 instead
--  random( 2 )      ;   = 2
--  random( 100 )     ;   = 81
--  random( 70, 80 )   ;   = 76
--  upper and lower MUST be positive ints, else crash

--  you rarely call math.randomseed(), so no need for extra shortcut.
--  Love.math.setRandomSeed() is a different generator, so if you
--  decide to use that, you'll need to prime it in a similar fashion.

--  seed for pseudo-random gen:  Equal seeds produce equal sequences
--  math.randomseed( 1234 );  random(), random(), random()
--  0.12414929654836    0.0065004425183874    0.3894466994232
--  math.randomseed( 1234 );  random(), random(), random()
--  0.12414929654836    0.0065004425183874    0.3894466994232

--  good seed is os.clock(),  wait a second before calling again.
--  first number not really 'random' (Win2K & OSX)
--  roll the dice a couple times to prime them.

--  math.randomseed( os.clock() );  random(), random(), random()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  represents +infinity. 
huge  = math.huge
--  huge      ;   = inf
--  huge /2    ;   = inf
--  -huge       ;   = -inf
--  huge /huge   ;   = nan
--  huge *0       ;   = nan
--  1/0            ;   = inf
--  1/0 == huge     ;   = true
--  huge == huge     ;   = true

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  constant π, and portions thereof
pi         = math .pi
quarterpi  = pi *0.25
halfpi     = pi *0.5
threeqpi   = pi *0.75
tau        = pi *2

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function clamp( num, lo, hi )
  lo  = lo or 0  --  default lo 0, hi 1
  hi  = hi or 1
  return min( max( lo, num ), hi )
end -- clamp()


--  Interpolation methods
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  paulbourke.net/miscellaneous/interpolation
--  codeplea.com/simple-interpolation
--  www.gizma.com/easing


-- jump from one value to the next halfway through
function step( a, b,  mu )
  if mu < 0.5 then  return a
  else  return b
  end -- if mu
end -- step()


-- straight Linear interpolation between two numbers.
function lerp( a, b,  mu )
  return a +(b -a) *mu
end -- lerp()


-- curvy Cosine interpolation between two numbers.
function cerp( a, b,  mu )
  local f  = (1 -cos(mu *pi)) *0.5
  return a *(1 -f) +b *f
end -- cerp()


--  similar to cerp, but faster
function smoothStep( a, b,  mu )
  return lerp( a,  b,  mu ^2 *(3 -2 *mu) )
end -- smoothStep()


--  quad-in speed up
function acceleration( a, b,  mu )
  return lerp( a,  b,  mu ^2 )
end -- acceleration()


--  quad-out slow down
function deceleration( a, b,  mu )
  return lerp( a,  b,  1- (1 -mu) ^2 )
end -- deceleration()


--  gently ramp up, then down
function quad_inout( a, b,  mu )
  if mu < 0.5 then  return acceleration( a, b,  mu )
  else  return deceleration( a, b,  mu )
  end
end -- quad_inout()


-- soft cubic interpolation between 2 endpoints, + 2 outer control points
function cubic( y1, y2, y3, y4,  mu )
  local mu2  = mu ^2
  local a1  = y4 -y3 -y1 -y2
  local a2  = y1 -y2 -a1
  local a3  = y3 -y1
  local a4  = y2

  return ( a1 *mu *mu2 +a2 *mu2 +a3 *mu +a4 )
end -- cubic()


--  Tension: -1 is low,  0 normal,  1 high
--  Bias: neg towards last segment,  0 is even,  pos to first segment
function hermite( y1, y2, y3, y4, mu, tension, bias )
  local mu2  = mu ^2
  local mu3  = mu2 *mu

  local m1  =     (y2 -y1) *(1 +bias) *(1 -tension) /2
  local m1  = m1 +(y3 -y2) *(1 -bias) *(1 -tension) /2
  local m2  =     (y3 -y2) *(1 +bias) *(1 -tension) /2
  local m2  = m2 +(y4 -y3) *(1 -bias) *(1 -tension) /2

  local a1 =  2 *mu3 -3 *mu2 +1
  local a2 =     mu3 -2 *mu2 +mu
  local a3 =     mu3 -   mu2
  local a4 = -2 *mu3 +3 *mu2

  return ( a1 *y2 +a2 *m1 +a3 *m2 +a4 *y3 )
end -- hermite()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  Normalize two numbers to a common scale
function normalize( x, y )
  --  Pythag  aSquared + bSquuared.
  local c  = sqrt(x ^2 + y ^2)
  --    SquRt = c
  if c == 0 then  return 0,0,0
  else  return x /c,  y /c,  c -- ratios with a common denomonator
  end
end -- normalize()

--  example:
--  a, b, c  = normalize( 8, 13 )
--  print( a *c,  b *c )   ;   8  13


function angleR( x1, y1,  x2, y2 ) -- angle between two points, radians
  return atan2( y2 -y1,  x2 -x1 )
end -- angleR()


function angleD( x1, y1,  x2, y2 ) -- angle between two points, degrees
  local t  = -deg( atan2( x2 -x1, y2 -y1 ))
  if t < 0 then t  = t +360 end
  return t
end -- angleD()


function dist( x1, y1,  x2, y2 )  --  distance between two points.
--  Pythag       aSquared + bSquared.
  return sqrt((x2 -x1) ^2 + (y2 -y1) ^2)
  --  squareRoot = c
end -- dist()


function dist3d( x1, y1, z1,  x2, y2, z2 ) -- between two 3D points.
--  Pythag     aSquared  +  bSquared  +  cSquared.
  return sqrt((x2 -x1) ^2 + (y2 -y1) ^2 + (z2 -z1) ^2)
  --  squareRoot = d
end -- dist3d()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  love2d.org/wiki/BoundingBox.lua

-- AABB Collision detect.  true if two boxes overlap,  otherwise false.
-- x1, y1  are top-left coords of first box,
-- w1, h1  are width and height;  similar convention for second box.
function checkCollision( x1, y1, w1, h1,  x2, y2, w2, h2 )
  local found  = false
  if x1 < x2 +w2 then            --     .--------.
    if x2 < x1 +w1 then          --     |        |     Axis-Aligned
      if y1 < y2 +h2 then        --     |   A    |     Bounding Boxes
        if y2 < y1 +h1 then      --     |        |
          found  = true          --     |    .---+----.
        end  --  this compiles   --     |    |   |    |
      end  --  to faster code    --     '----+---'    |
    end  --  than the example    --          |        |
  end  --  on love2D.org         --          |    B   |
return found                     --          |        |
end -- checkCollision()          --          '--------'


-- radial Collision.  true if two circles overlap,  otherwise false.
-- x1, y1  are central coordinates of first circle,
-- r1 is radius;  similar convention for second circle.  0-o
function radialCollision( x1, y1, r1,  x2, y2, r2 )
  return dist( x1, y1,  x2, y2 ) < r1 +r2
end -- radialCollision()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  1 if positive,  -1 if negative,  or 0
function sign( number )
  if number > 0 then  return 1
  elseif number < 0 then  return -1
  else  return 0
  end
end -- sign


--  Randomly returns either -1 or 1
function rsign()
  if random(2) == 2 then return -1
  else return 1
  end
end -- rsign()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--[[  Lua 5.3 notes.
  not compatible w/ LuaJIT, so not likely to be in Love2D,
  but for those learning Lua, it's nice to know the differences

--  optional x, more like atan2.  default value for x is 1
math.atan (y [, x])

--  integer with minimum value for an integer
math.mininteger   ;   = -9223372036854775808

--  integer with maximum value for an integer
math.maxinteger   ;   = 9223372036854775807

--  if x is convertible to int, returns int. Otherwise, nil
math.tointeger( 1 )    ;   = 1
math.tointeger( 1.1 )  ;   = nil

--  Returns "integer",  "float",  or "nil" if x is not a number
math.type( 3 )    ;   = integer
math.type( 3.3 )  ;   = float
math.type( 'a' )  ;   = nil

--  true if int m is below int n
math.ult( 2, 3 )   ;   = true
math.ult( 3, 2 )   ;   = false

]]--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
