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

title  = win .getTitle()
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

style  = 'data/fonts/C64_Pro-STYLE.ttf'
smallFontSize   = 12
mediumFontSize  = 14
largeFontSize   = 16

pad  = 15  -- border padding
rpad  = WW -pad
dpad  = HH -pad

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  convert color range(0-255) to range(0-1)

function c255(r, g, b, a)
  local r  = r /255
  local g  = g /255
  local b  = b /255

  if a then
    local a  = a /255
    return { r, g, b, a }
  else
    return { r, g, b }
  end -- if a
end -- c255

black  = { 0, 0, 0 }
cBlue  = c255( 62, 49, 162 )
ltBlue = c255( 124, 112, 218 )
white  = { 1, 1, 1 }

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console

-- Print contents of `tbl`, with indentation.
-- optional `indent` sets the initial level of indentation.
-- optional `maxindent` lets you decide how deep you desire recursion.

function prettyprint( tbl,  indent,  maxindent )
  if not indent then indent  = 0 end
  if not maxindent then maxindent  = 20 end

  for k, v in pairs( tbl ) do
    form  = string.rep( '   ', indent ) ..k

    if indent %3 == 0 then -- alternate delimiters, cycle every 3 rows
      form  = form..') '
    elseif indent %3 == 2 then
      form  = form..': '
    else
      form  = form ..'. '
    end

    if type(v) == 'table' then
      print( form )
      if k < maxindent then -- recursive call to self, deeper indent
        prettyprint( v, indent +1 )
      end -- don't go too deep down that rabbithole, you might crash

    elseif type(v) == 'boolean' then
      print( form ..tostring(v) )
    else
      print( form ..v )
    end -- if type ==

  end -- for k, v in pairs
end -- prettyprint()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
