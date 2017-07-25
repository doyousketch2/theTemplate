--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Löve theTemplate       GNU GPLv3          @Doyousketch2

-- global abbreviations,  can be used in any module.
Lo   = love
-- look in conf.lua to enable necessary modules.
aud  = Lo .audio             mou  = Lo .mouse
eve  = Lo .event             phy  = Lo .physics
fil  = Lo .filesystem        sou  = Lo .sound
fon  = Lo .Font              sys  = Lo .system
gra  = Lo .graphics          thr  = Lo .thread
ima  = Lo .image             tim  = Lo .timer
joy  = Lo .joystick          tou  = Lo .touch
key  = Lo .keyboard          vid  = Lo .video
mat  = Lo .math              win  = Lo .window
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
WW  = gra .getWidth()        HH  = gra .getHeight()
-- screen divisions:  quarter,  third,  and tenth
w25  = WW *0.25                     w33  = WW *0.333
w1   = WW *0.1     w2  = WW *0.2     w3  = WW *0.3
w4   = WW *0.4     w5  = WW *0.5     w6  = WW *0.6
w7   = WW *0.7     w8  = WW *0.8     w9  = WW *0.9
w66  = WW *0.667                    w75  = WW *0.75
--                  { w5, h5 }  = center of screen
h25  = HH *0.25                     h33  = HH *0.333
h1   = HH *0.1     h2  = HH *0.2     h3  = HH *0.3
h4   = HH *0.4     h5  = HH *0.5     h6  = HH *0.6
h7   = HH *0.7     h8  = HH *0.8     h9  = HH *0.9
h66  = HH *0.667                    h75  = HH *0.75
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- local vars to be used within this file,  or function scope.

local track  = ''
local bgmdir  = fil .getDirectoryItems( 'data/music/' )

local fontsize  = 15
local style  = 'data/fonts/C64_Pro-STYLE.ttf'

local enemy  = require 'libs.enemy'
local e  = {} -- list of enemies

local eMax  = 200 -- max amount of enemies on screen at once
local timer  = 0
local once  = false

local black  = {   0,   0,   0 }
local cBlue  = {  62,  49, 162 }
local ltBlue = { 124, 112, 218 }
local white  = { 255, 255, 255 }

local smallFontSize   = 16
local mediumFontSize  = 20
local largeFontSize   = 30
local xlargeFontSize  = 35

local pad  = 15  -- border padding  l,r,u,d
local lpad  = pad     local rpad  = WW -pad
local upad  = pad     local dpad  = HH -pad

local states  = { 'blank', 'header', 'mem', 'ready', 'run', 'game' }
local state  = states[1]
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
end -- newSong()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- initialize stuff.  can access commandline args here,  if you need them.

function Lo .load( arg )
  print('Löve app begin')

  for a = 1,  #arg do -- 'arg' is a list of all the args,  so iterate through it.
    local ar  = arg[a]
    if ar ~= '.' then -- dot is used when loading in Linux,  so we'll skip it.
      if ar == '-h' or ar == '-help'  then
        print('This is theTemplate by Doyousketch2 for Love2D\n')
        eve .quit()
      else -- do something here if certain args are passed.  just prints 'em for demonstration.
        print('arg ' ..a ..': ' ..ar )
      end -- if ar ==
    end -- if ar ~= '.'
  end -- for arg

  -- disable ar so pixels remain crisp while zooming,  used for pixel art
  -- gra .setDefaultFilter( 'nearest',  'nearest',  0 )

  mat .setRandomSeed( os .time() )
  gra .setBackgroundColor( cBlue )
  gra .setColor( ltBlue )
  gra .setLineWidth( pad *2 )

  smallFont   = gra .newFont( style, smallFontSize )
  mediumFont  = gra .newFont( style, mediumFontSize )
  largeFont   = gra .newFont( style, largeFontSize )
  xlargeFont  = gra .newFont( style, xlargeFontSize )

  gra .setFont( mediumFont )
end -- Lo .load(arg)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Scancodes are international,  keyboard layout-independent.
-- see scancodes.txt in the data dir for reference.

function Lo .keypressed( key, scancode, isrepeat ) -- action continues while key pressed
  if scancode == 'escape'  then  eve .quit()  end

  if scancode == 'space'  then -- toggle game state
    if state == states[#states]  then  state = states[1] -- if last,  jump to beginning
    else   s = 1
      while state ~= states[s]  do  s  = s +1  end -- scroll through list 'till find match
      state  = states[s +1] -- pick next entry
    end -- if state ==
  end -- if scancode == 'space'

  if scancode == 'left'  then  player .x  = player .x -1  end
  if scancode == 'right' then  player .x  = player .x +1  end

  if scancode == 'up'   then  player .y  = player .y +1  end
  if scancode == 'down' then  player .y  = player .y -1  end

end -- Lo .keypressed

-- triggers after user releases key,  better for single press actions
function Lo .keyreleased( key, scancode )

  if scancode == 'end' then -- skip to the next song
    bgm :stop()
  end -- if scancode

end -- Lo .keyreleased

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Callback function used to update state of game every frame,  occurs before draw()

function Lo .update( dt ) -- DeltaTime  = time since last update,  in seconds.
  timer  = timer +dt

  if state == 'blank' then
    if timer > 1  then state = 'header' end

  elseif state == 'header' then
    if timer > 1.5 then state = 'mem' end

  elseif state == 'mem' then
    if timer > 2  then state = 'ready' end

  elseif state == 'ready' then
    if timer > 2.5  then state = 'load' end

  elseif state == 'load' then
    if timer > 3  then state = 'run' end

  elseif state == 'run' then
    if timer > 4.5  then state = 'game' end

  elseif state == 'game' then
    if once == false then
      once = true
      newSong()  -- begin music
    end

    if #e < eMax then
      if timer > .5 then -- spawn a new enemy every half-second

        local rn  = mat .random() -- randomly pick which enemy
        if rn > .6 then
          e[ #e +1 ]  = enemy .dia() -- spawn a diamond
        elseif rn > .2 then
          e[ #e +1 ]  = enemy .hex() -- spawn a hexagon
        else
          e[ #e +1 ]  = enemy .cir() -- spawn a circle
        end -- if random...

        timer  = 0 -- reset timer
      end -- if timer
    end -- if #e

    for i = 1,  #e do -- update enemy locations
      local E  = e[i]
      E.x  = E.x  +  E.vx * dt
      E.y  = E.y  +  E.vy * dt

      if E.x < lpad or E.x > rpad then -- if hit wall
        E.vx  = -E.vx              -- reverse direction
      end

      if E.y < upad or E.y > dpad then -- if hit ceiling or floor
        E.vy  = -E.vy              -- reverse direction
      end
    end -- for i = 1,  #e

    -- keep the music playing
    if bgm :isStopped() then
      newSong()
    end -- if bgm
  end -- if state == 'game'
end -- Lo .update(dt)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Callback function used to draw on the screen every frame.

function Lo .draw()

  if state == 'blank' then

    gra .setColor( ltBlue )

    --  'fill' or 'line'   topL, topR, bottomR, bottomL
    gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )


  elseif state == 'header' then

    gra .setColor( ltBlue )

    --  'fill' or 'line'   topL, topR, bottomR, bottomL
    gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )

  -- gra .print( 'message',  x,  y,  rotation in radians,  scaleX,  scaleY )
    gra .print( '****  Love theTemplate v 0.10.2  ****',  w1 -30,  h1 )


  elseif state == 'mem' then

    gra .setColor( ltBlue )

    --  'fill' or 'line'   topL, topR, bottomR, bottomL
    gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )

  -- gra .print( 'message',  x,  y,  rotation in radians,  scaleX,  scaleY )
    gra .print( '****  Love theTemplate v 0.10.2  ****',  w1 -30,  h1 )
    gra .print( '64K RAM SYSTEM  38911 BASIC BYTES FREE',  w1 -30,  h1 +30 )


  elseif state == 'ready' then

    gra .setColor( ltBlue )

    --  'fill' or 'line'   topL, topR, bottomR, bottomL
    gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )

  -- gra .print( 'message',  x,  y,  rotation in radians,  scaleX,  scaleY )
    gra .print( '****  Love theTemplate v 0.10.2  ****',  w1 -30,  h1 )
    gra .print( '64K RAM SYSTEM  38911 BASIC BYTES FREE',  w1 -30,  h1 +30 )

    gra .print( 'READY',  w1,  h3 -30 )


  elseif state == 'load' then

    gra .setColor( ltBlue )

    --  'fill' or 'line'   topL, topR, bottomR, bottomL
    gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )

  -- gra .print( 'message',  x,  y,  rotation in radians,  scaleX,  scaleY )
    gra .print( '****  Love theTemplate v 0.10.2  ****',  w1 -30,  h1 )
    gra .print( '64K RAM SYSTEM  38911 BASIC BYTES FREE',  w1 -30,  h1 +30 )

    gra .print( 'READY',  w1,  h3 -30 )
    gra .print( 'LOAD \"*\", 8, 1',  w1,  h3 )


  elseif state == 'run' then

    gra .setColor( ltBlue )

    --  'fill' or 'line'   topL, topR, bottomR, bottomL
    gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )

  -- gra .print( 'message',  x,  y,  rotation in radians,  scaleX,  scaleY )
    gra .print( '****  Love theTemplate v 0.10.2  ****',  w1 -30,  h1 )
    gra .print( '64K RAM SYSTEM  38911 BASIC BYTES FREE',  w1 -30,  h1 +30 )

    gra .print( 'READY',  w1,  h3 -30 )
    gra .print( 'LOAD \"*\", 8, 1',  w1,  h3 )
    gra .print( 'RUN',  w1,  h3 +30 )


  elseif state == 'game' then

    for i = 1,  #e do  -- draw enemies
      local E  = e[i]
      gra .setColor( E.R,  E.G,  E.B ) -- red, green, blue
      gra .circle( 'fill',  E.x,  E.y,  E.size,  E.segments ) -- style,  x,  y,  radius,  segments
    end -- for #e

    gra .setColor( ltBlue )

    --  'fill' or 'line'   topL, topR, bottomR, bottomL
    gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )

  -- gra .print( 'message',  x,  y,  rotation in radians,  scaleX,  scaleY )
    gra .print( '****  Love theTemplate v 0.10.2  ****',  w1 -30,  h1 )
    gra .print( '64K RAM SYSTEM  38911 BASIC BYTES FREE',  w1 -30,  h1 +30 )

    gra .print( track,  w1,  h3 -30 )

    gra .print( 'tap End key to hear the next song',  w1 +20,  h9 )

  end -- if state ==
end -- Lo .draw()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .quit() -- do stuff before exit,  autosave,  say goodbye...
  print('Löve app exit')
end -- Lo .quit()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

