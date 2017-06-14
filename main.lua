--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Löve theTemplate

LO   = love

-- 3 letter abbrev's
aud  = LO .audio        --  enabled
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
sou  = LO .sound        --  enabled
sys  = LO .system    --
thr  = LO .thread    --
tim  = LO .timer        --  enabled
tou  = LO .touch        --  enabled
vid  = LO .video     --
win  = LO .window       --  enabled

-- look in conf.lua to enable necessary modules

HH  = gra .getHeight()
WW  = gra .getWidth()

local track  = nil
local bgmdir  = fil .getDirectoryItems( 'data/music/' )

local fontsize  = 15
local style  = 'data/fonts/C64_Pro-STYLE.ttf'
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function newSong() -- public domain songs from modarchive.org
  local lasttrack  = track
  while track == lasttrack do -- shuffle 'til we're certain it's not the same song
    track  = bgmdir[ mat .random( #bgmdir ) ]
  end
  print( 'track:  ' ..track )
  bgm  = aud .newSource( 'data/music/' ..track )
  aud .play( bgm )
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function LO .load()
  print('Löve App begin')

  gra .setDefaultFilter( 'nearest',  'nearest',  0 )
  gra .setBackgroundColor( 62,  49,  162 )
  gra .setColor( 124,  112,  218 )
  gra .setLineWidth( 30 )

  newSong()  -- begin music

  font  = gra .newFont( style,  fontsize )
  gra .setFont( font )
end -- LO .load()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function LO .update(dt)

  -- keep the music playin'
  if bgm :isStopped() then
    newSong()
  end -- if bgm
end -- LO .update(dt)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function LO .keypressed( key, scancode, isrepeat )
  if scancode == 'end' then -- skip to the next song
    bgm :stop()
  end -- if scancode == 'end'
end -- LO .keypressed

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function LO .draw()

  gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )
--    'fill' or 'line'   topL, topR, bottomR, bottomL

-- gra .print( message,  x,  y,  rotation in radians,  scaleX,  scaleY )
  gra .print( '****  Love theTemplate v 0.10.2  ****',  60,  30 )
  gra .print( '64K RAM SYSTEM  38911 BASIC BYTES FREE',  60,  60 )

  gra .print( 'READY',  40,  120 )
  gra .print( track,  40,  150 )
end -- LO .draw()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function LO .quit()
  print('Löve App exit')
end -- LO .quit()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

