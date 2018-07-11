-- global abbreviations,  can be used in any module.
Lo   = love

aud  = Lo .audio   -- look in conf.lua to enable necessary modules.
dat  = Lo .data              mou  = Lo .mouse
eve  = Lo .event             phy  = Lo .physics
fil  = Lo .filesystem        sou  = Lo .sound
fon  = Lo .font              sys  = Lo .system
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
-- example:  { w5, h5 }  = center of screen
h25  = HH *0.25                     h33  = HH *0.333
h1   = HH *0.1     h2  = HH *0.2     h3  = HH *0.3
h4   = HH *0.4     h5  = HH *0.5     h6  = HH *0.6
h7   = HH *0.7     h8  = HH *0.8     h9  = HH *0.9
h66  = HH *0.667                    h75  = HH *0.75
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- typically, local variables are faster, so use them when you can.

timer  = 0

pi         = math .pi
quarterpi  = pi *0.25
halfpi     = pi *0.5
threeqpi   = pi *0.75
tau        = pi *2

style  = 'data/fonts/C64_Pro-STYLE.ttf'
smallFontSize   = 16
mediumFontSize  = 20
largeFontSize   = 30

black  = {   0,   0,   0 }
cBlue  = {  62/255,  49/255, 162/255 }
ltBlue = { 124/255, 112/255, 218/255 }
white  = { 1, 1, 1 }

pad  = 15  -- border padding
rpad  = WW -pad
dpad  = HH -pad
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


-- define state manager, which will load desired state module from states dir
function loadState( state )
  clearCallbacks()
  require ('states.' ..state)

  print( 'Gamestate:  ' ..state )
  load()
end -- loadState()
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
