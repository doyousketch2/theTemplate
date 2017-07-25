function load()
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .keypressed( key, scancode, isrepeat ) -- action continues while key pressed
  if scancode == 'escape'  then  eve .quit()  end
end -- Lo .keypressed

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .update( dt ) -- DeltaTime  = time since last update,  in seconds.
  timer  = timer +dt

  if timer > 0.5 then
    loadState( 'header' )
  end -- if timer >
end -- Lo .update(dt)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .draw()
  gra .setColor( ltBlue )

  --  'fill' or 'line'   topL, topR, bottomR, bottomL
  gra .polygon( 'line',  0,0,  WW,0,  WW,HH,  0,HH )

end -- Lo .draw()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
