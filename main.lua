--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Löve theTemplate       GNU GPLv3          @Doyousketch2

require 'libs.globals'
require 'libs.maths'
require 'libs.state_manager'

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 -- initial love .load() function,  individual gamestates simply use load() to initialize.

function Lo .load()
  print('Löve app begin:  ' ..title )

  for a = 1,  #arg do -- 'arg' is a list of all the args,  so iterate through it.
    local ar  = arg[a]

    if ar ~= '.' then -- dot is used when loading in Linux,  so we'll skip it.
      if ar == '-h' or ar == '-help'  then
        print( title ..' by Doyousketch2 for Love2D\n' )
        eve .quit()

      else -- do something here if certain args are passed.  just prints 'em for demonstration.
        print('arg ' ..a ..': ' ..ar )
      end -- if ar ==
    end -- if ar ~= '.'
  end -- for arg

  -- disable antialiasing, so pixels remain crisp while zooming,  used for pixel art
  gra .setDefaultFilter( 'nearest',  'nearest',  0 )

 -- initialize random numbers, otherwise Love defaults to the same number each time ?!?
  mat .setRandomSeed( os .time() )
  mat .random()   mat .random()   mat .random()

  gra .setBackgroundColor( cBlue )
  gra .setColor( ltBlue )
  gra .setLineWidth( pad *2 )

  smallFont   = gra .newFont( style, smallFontSize )
  mediumFont  = gra .newFont( style, mediumFontSize )
  largeFont   = gra .newFont( style, largeFontSize )

  gra .setFont( mediumFont )
  loadState( 'intro' )
end -- Lo .load()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .quit() -- do stuff before exit,  autosave,  say goodbye...
  print( 'Löve app exit:  ' ..title )
end -- Lo .quit()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

