--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

local track  = ''
local bgmdir  = fil .getDirectoryItems( 'data/music/' )

local enemy  = require 'libs.enemy'
local e  = {} -- list of enemies

local eMax  = 200 -- max amount of enemies on screen at once

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

function load()
  newSong()  -- begin music
end

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

    if E.x -E.size < lpad or E.x +E.size > rpad then -- if hit wall
      E.vx  = -E.vx              -- reverse direction
    end

    if E.y -E.size < upad or E.y +E.size > dpad then -- if hit ceiling or floor
      E.vy  = -E.vy              -- reverse direction
    end
  end -- for i = 1,  #e

  -- keep the music playing
  if bgm :isStopped() then
    newSong()
  end -- if bgm

end -- Lo .update(dt)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Callback function used to draw on the screen every frame.

function Lo .draw()

  for i = 1,  #e do  -- draw enemies
    local ee  = e[i]
    gra .setColor( E.R,  E.G,  E.B ) -- red, green, blue
    gra .circle( 'fill',  E.x,  E.y,  E.size,  E.segments ) -- style,  x,  y,  radius,  segments
  end -- for #e

  gra .setColor( ltBlue )

  --  'fill' or 'line'   topL, topR, bottomR, bottomL
  gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )

-- gra .print( 'message',  x,  y,  rotation in radians,  scaleX,  scaleY )
  gra .print( '****  Love theTemplate v 0.10.2  ****',  w1 -30,  h1 )
  gra .print( '64K RAM SYSTEM  38911 BASIC BYTES FREE',  w1 -30,  h1 +30 )

  gra .print( track,  w1 -10,  h3 -30 )

  gra .print( 'tap End key to hear the next song',  w1 +20,  h9 )

end -- Lo .draw()
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
