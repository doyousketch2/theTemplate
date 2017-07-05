--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Löve theTemplate

LO   = love
-- look in conf.lua to enable necessary modules
-- 3 letter abbrev's     dashes = disabled entries
aud  = LO .audio
eve  = LO .event
fil  = LO .filesystem
fon  = LO .font
gra  = LO .graphics
ima  = LO .image
joy  = LO .joystick    --
key  = LO .keyboard
mat  = LO .math
mou  = LO .mouse
phy  = LO .physics     --
sou  = LO .sound
sys  = LO .system      --
thr  = LO .thread      --
tim  = LO .timer
tou  = LO .touch
vid  = LO .video       --
win  = LO .window

HH  = gra .getHeight()
WW  = gra .getWidth()

local track  = nil
local bgmdir  = fil .getDirectoryItems( 'data/music/' )

local fontsize  = 15
local style  = 'data/fonts/C64_Pro-STYLE.ttf'

local enemy  = require 'libs.enemy'
local e  = {} -- list of enemies

local timer  = 0
local maxClones  = 200
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- define functions you'll use within the body of your app

function newSong() -- public domain songs from modarchive.org
  local lasttrack  = track
  while track == lasttrack do -- shuffle 'til we're certain it's not the same song
    track  = bgmdir[ mat .random( #bgmdir ) ]
  end
  print( 'track:  ' ..track )
  bgm  = aud .newSource( 'data/music/' ..track )
  aud .play( bgm )
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- initialize stuff.  can access commandline args here,  if you need them.

function LO .load( arg )
  print('Löve app begin')

  for a = 1,  #arg do -- 'arg' is a list of all the args,  so iterate through it.
    if arg[a] ~= '.' then -- dot is used when loading in Linux,  so we'll skip it.

      -- do something here if certain args are passed.  just prints 'em for demonstration.
      print('arg ' ..a ..': ' ..arg[a] )
    end -- if '.'
  end -- for arg

  -- diable AA so pixels remain crisp while zoooming,  used for pixel art
  gra .setDefaultFilter( 'nearest',  'nearest',  0 )

  mat .setRandomSeed(  os .time()  )
  gra .setBackgroundColor( 62,  49,  162 )
  gra .setLineWidth( 30 )

  newSong()  -- begin music

  font  = gra .newFont( style,  fontsize )
  gra .setFont( font )
end -- LO .load(arg)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Scancodes are international,  keyboard layout-independent.
-- see scancodes.txt in the data dir for reference.

function LO .keypressed( key, scancode, isrepeat ) -- action continues while key pressed

  if scancode == 'left'  then  player .x  = player .x -1  end
  if scancode == 'right' then  player .x  = player .x +1  end

  if scancode == 'up'   then  player .y  = player .y +1  end
  if scancode == 'down' then  player .y  = player .y -1  end

end -- LO .keypressed

-- triggers after user releases key,  better for single press actions
function LO .keyreleased( key, scancode )

  if scancode == 'end' then -- skip to the next song
    bgm :stop()
  end -- if scancode ==

end -- LO .keyreleased

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Callback function used to update state of game every frame,  occurs before draw()

function LO .update( dt ) -- DeltaTime  = time since the last update,  in seconds.
  timer  = timer +dt

  if #e < maxClones then
    if timer > .5 then
      if mat .random() > .5 then -- randomly decide which it'll be
        e[ #e +1 ]  = enemy .dia() -- spawn a diamond
      else
        e[ #e +1 ]  = enemy .hex() -- spawn a hexagon
      end -- if random > .5

      timer  = 0 -- reset timer
    end -- if timer
  end -- if #e

  for i = 1,  #e do -- update enemy locations
    e[i] .x  = e[i] .x +e[i] .vx *dt
    e[i] .y  = e[i] .y +e[i] .vy *dt

    if e[i] .x < 1 or e[i] .x > WW -1 then
      e[i] .vx  = -e[i] .vx
    end

    if e[i] .y < 1 or e[i] .y > HH -1 then
      e[i] .vy  = -e[i] .vy
    end
  end -- for i = 1,  #e

  -- keep the music playin'
  if bgm :isStopped() then
    newSong()
  end -- if bgm

end -- LO .update(dt)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Callback function used to draw on the screen every frame.

function LO .draw()
  -- draw enemies
  for i = 1,  #e do -- style,   x,  y,   radius, segments
    gra .setColor( e[i] .R,  e[i] .G,  e[i] .B )
    gra .circle( 'fill',  e[i] .x,  e[i] .y,  e[i] .size,  e[i] .segments )
  end -- for #e

  gra .setColor( 124,  112,  218 )

--    'fill' or 'line'   topL, topR, bottomR, bottomL
  gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )

-- gra .print( 'message',  x,  y,  rotation in radians,  scaleX,  scaleY )
  gra .print( '****  Love theTemplate v 0.10.2  ****',  150,  30 )
  gra .print( '64K RAM SYSTEM  38911 BASIC BYTES FREE',  150,  60 )

  gra .print( 'READY',  60,  120 )
  gra .print( track,  60,  150 )

  gra .print( 'tap End key to hear the next song',  150,  HH -40 )
end -- LO .draw()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function LO .quit() -- do stuff before exit,  autosave,  say goodbye...
  print('Löve app exit')
end -- LO .quit()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

