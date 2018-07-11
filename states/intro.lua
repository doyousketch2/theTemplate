function load()
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .keypressed( key, scancode, isrepeat ) -- action continues while key pressed
  if scancode == 'escape'  then  eve .quit()  end
end -- Lo .keypressed

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .update( dt ) -- DeltaTime  = time since last update,  in seconds.
  timer  = timer +dt

    if timer > 3.5  then
    loadState( 'game' )
  end -- if timer >
end -- Lo .update(dt)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .draw()
  gra .setColor( ltBlue )

  --  'fill' or 'line'   topL, topR, bottomR, bottomL
  gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )

-- gra .print( 'message',  x,  y,  rotation in radians,  scaleX,  scaleY )
  gra .print( '****  Love theTemplate v 11.1  ****',  w1 -30,  h1 )
  gra .print( '64K RAM SYSTEM  38911 BASIC BYTES FREE',  w1 -30,  h1 +30 )

  gra .print( 'READY',  w1 -10,  h3 -30 )

  if timer > 1.5  then
    gra .print( 'LOAD \"*\", 8, 1',  w1 -10,  h3 )
  end

  if timer > 2.5  then
    gra .print( 'RUN',  w1 -10,  h3 +30 )
  end

end -- Lo .draw()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
