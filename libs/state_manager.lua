--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Clear callbacks -  https://love2d.org/wiki/love
-- This is so that when you switch gamestate,
-- it won't try to use code from a previously loaded state.
-- Do the same w/ any callbacks you use, that aren't redefined.

function clearCallbacks()
  Lo .keypressed  = nil
  Lo .keyreleased  = nil

  Lo .touchmoved  = nil
  Lo .touchpressed  = nil
  Lo .touchreleased  = nil

  Lo .wheelmoved  = nil
  Lo .mousemoved  = nil
  Lo .mousepressed  = nil
  Lo .mousereleased  = nil

  Lo .gamepadaxis  = nil
  Lo .gamepadpressed  = nil
  Lo .gamepadreleased  = nil

  Lo .joystickhat  = nil
  Lo .joystickaxis  = nil
  Lo .joystickpressed  = nil
  Lo .joystickreleased  = nil
end -- clearCallbacks()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- define state manager, which will load desired state module from states dir
function loadState( state )
  clearCallbacks()
  require ('states.' ..state)

  print( 'Gamestate:  ' ..state )
  load()
end -- loadState()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

