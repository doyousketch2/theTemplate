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
-- it appears local vars aren't accessible through gamestates, using globals instead.
-- not a biggie, just make sure you don't re-use names for something else.

timer  = 0

style  = 'data/fonts/C64_Pro-STYLE.ttf'
smallFontSize   = 16
mediumFontSize  = 20
largeFontSize   = 30
xlargeFontSize  = 35

black  = {   0,   0,   0 }
cBlue  = {  62,  49, 162 }
ltBlue = { 124, 112, 218 }
white  = { 255, 255, 255 }

pad  = 15  -- border padding  l,r,u,d
lpad  = pad     rpad  = WW -pad
upad  = pad     dpad  = HH -pad
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- define state manager, which will load main.lua within its respective states subdir

function clearCallbacks()
	Lo .update  = nil
	Lo .draw  = nil
	Lo .keypressed  = nil
	Lo .keyreleased  = nil
	Lo .mousepressed  = nil
	Lo .mousereleased  = nil
	Lo .joystickpressed  = nil
	Lo .joystickreleased  = nil
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function loadState( state )
	clearCallbacks()
	print( 'Gamestate:  ' ..state )
	require ('states.' ..state ..'.main')
	load()
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 -- initial love .load() function,  individual gamestates simply use load() to initialize.

function Lo .load()
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

  -- disable antialiasing, so pixels remain crisp while zooming,  used for pixel art
  -- gra .setDefaultFilter( 'nearest',  'nearest',  0 )

 -- initialize random numbers, otherwise Love defaults to the same number each time ?!?
  mat .setRandomSeed( os .time() )

  gra .setBackgroundColor( cBlue )
  gra .setColor( ltBlue )
  gra .setLineWidth( pad *2 )

  smallFont   = gra .newFont( style, smallFontSize )
  mediumFont  = gra .newFont( style, mediumFontSize )
  largeFont   = gra .newFont( style, largeFontSize )
  xlargeFont  = gra .newFont( style, xlargeFontSize )

  gra .setFont( mediumFont )
	loadState( 'blank' )
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .quit() -- do stuff before exit,  autosave,  say goodbye...
  print('Löve app exit')
end -- Lo .quit()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

