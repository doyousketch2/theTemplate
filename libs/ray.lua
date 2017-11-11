ray  = {} -- namespace

ray .dist  = {}
ray .wall  = {}
ray .color  = {}

ray .distanceToCameraPlane  = w5 /math.tan( halfFov )
ray .subsequent  = fov /WW -- http://permadi.com/1996/05/ray-casting-tutorial-5/

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function ray :cast()

  local maps  = require 'data.maps'
  local map  = maps[ level ]

  local hNorm  = player .x %1 -- player pos, normalized to one grid space
  local vNorm  = player .y %1

  for i = 1, fov do -- fan out from left to right --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    local a  = player.begin +i *ray .subsequent /7 -- start at left of screen, keep incrementing 'till right

    if a < 180            then hGrid = 1 else hGrid = -1 end
    if a < 90 or a >= 270 then vGrid = 1 else vGrid = -1 end

    local hStep  = 1 /math.tan( a ) -- check horiz grid intersections
    local vStep  = math.tan( a ) -- check vert

    local horizX  = hStep -hNorm -- initial step is less than full step, so subtract player pos
    local horizY  = vNorm -- use a new variable, so we don't have to recalculate normalized position next time 'round

    local vertX  = hNorm -- ditto
    local vertY  = vStep -vNorm -- initial step, as above

    local rndHx  = player.x -- set up new variables,
    local rndHy  = player.y -- so we don't have to
    local rndVx  = player.x -- recalculate distance,
    local rndVy  = player.y -- once the value is found.

    local collide  = false --======================================================================

    while collide == false do
      rndHx, rndHy  = hInteger( horizX, horizY, a )
      rndVx, rndVy  = vInteger(  vertX, vertY, a )

      if     rndHx < 1 or rndHx > map .x then -- Test horiz components for out of bounds
        collide  = true
        ray .color[i]  = { 0,0,0 }

      elseif rndHy < 1 or rndHy > map .y then
        collide  = true
        ray .color[i]  = { 100,0,0 }

      elseif rndVx < 1 or rndVx > map .x then -- Test vert...
        collide  = true
        ray .color[i]  = { 0,100,0 }

      elseif rndVy < 1 or rndVy > map .y then
        collide  = true
        ray .color[i]  = { 0,0,100 }

   -- test collisions
      elseif map[ data ][ rndHy ][ rndHx ] > 0 then
        collide  = true
        ray .color[i]  = { 255,200,200 }

      elseif map[ data ][ rndVy ][ rndVx ] > 0 then
        collide  = true
        ray .color[i]  = { 200,200,255 }

      else -- if no collisions found, take another step
        horizX  = horizX +hStep -- add proportional step to find intersections with horizontal walls
        horizY  = horizY +vGrid -- add full grid step

        vertX  = vertX +hGrid -- add full grid step to find intersections with vertical walls
        vertY  = vertY +vStep -- add proportional step
      end -- collision tests & increment

    end -- collision found  =======================================================================

    horizDist  = math.sqrt(rndHx *rndHx  +  rndHy *rndHy) -- pythagorus:  A squared + B squared = C squared
    vertDist  = math.sqrt(rndVx *rndVx  +  rndVy *rndVy)

    if horizDist < vertDist then
      ray .dist[i]  = horizDist *math.cos(a) -- cos of angle corrects for barrel distortion
    else
      ray .dist[i]  = vertDist *math.cos(a)
    end -- compare horiz to vert distance, and pick the shorter of the two

      ray .wall[i]  = h5 /ray .dist[i] *ray .distanceToCameraPlane -- calculate projected wall height

  end -- fov loop, fanning out from left to right
end -- ray :cast()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

return ray

