--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Löve theTemplate

LO   = love
-- 3 letter abbrev's
aud  = LO .audio     --
eve  = LO .event        --  enabled
fil  = LO .filesystem   --  enabled
fon  = LO .font         --  enabled
gra  = LO .graphics     --  enabled
ima  = LO .image        --  enabled
joy  = LO .joystick  --
key  = LO .keyboard     --  enabled
mat  = LO .math         --  enabled
mou  = LO .mouse        --  enabled
phy  = LO .physics   --
sou  = LO .sound     --
sys  = LO .system    --
thr  = LO .thread    --
tim  = LO .timer        --  enabled
tou  = LO .touch        --  enabled
vid  = LO .video     --
win  = LO .window       --  enabled

-- look in .conf file to enable neccissary modules

HH  = gra .getHeight()
WW  = gra .getWidth()

local fontsize  = 18
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function LO .load()
  print('Löve App begin')

  gra .setDefaultFilter( 'nearest',  'nearest',  0 )
  gra .setBackgroundColor( 255,  255,  255 )
  gra .setColor( 0,  0,  0 )

  font  = gra .newFont( fontsize )
  gra .setFont( font )
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function LO .update(dt)

end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function LO .draw()
  gra .setLineWidth( 12 )

  gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )
--                       topL, topR, bottomR, bottomL

-- gra .print( message,  x,  y,  rotation in radians,  scaleX,  scaleY )
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function LO .quit()
  print('Löve App exit')
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

