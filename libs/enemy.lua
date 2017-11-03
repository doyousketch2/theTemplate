enemy  = {}  -- namespace
meta  = {  __index  = enemy  } -- metatable.

-- prototype / default values can be included here,  but they are generated once.
-- if you want unique values for each instance,  generate them when creating clone.

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function enemy :dia() -- create an object
  local instance  = {  name  = 'diamond',
                   segments  = 4,
                          R  = mat .random( 0,  100 ),
                          G  = mat .random( 50,  255 ),
                          B  = mat .random( 0,  50 ),
                       size  = mat .random( 5,  15 ),
                          x  = mat .random( 10,  WW -10 ),
                          y  = mat .random( 10,  HH -10 ),
                         vx  = mat .random( -50,  50 ),
                         vy  = mat .random( -50,  50 )  }

  setmetatable( instance,  meta ) -- link instance with metatable
  return instance
end -- dia

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function enemy :hex() -- generate new local colors and sizes
  local instance  = {  name  = 'hexagon',
                   segments  = 6,
                          R  = mat .random( 50,  255 ),
                          G  = mat .random( 0,  100 ),
                          B  = mat .random( 0,  50 ),
                       size  = mat .random( 5,  15 ),
                          x  = mat .random( 10,  WW -10 ),
                          y  = mat .random( 10,  HH -10 ),
                         vx  = mat .random( -50,  50 ),
                         vy  = mat .random( -50,  50 )  }

  setmetatable( instance,  meta )
  return instance
end -- hex

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function enemy :cir()
  local instance  = {  name  = 'circle',
                   segments  = 16,
                          R  = mat .random( 0,  30 ),
                          G  = mat .random( 0,  30 ),
                          B  = mat .random( 0,  30 ),
                       size  = mat .random( 5,  15 ),
                          x  = mat .random( 10,  WW -10 ),
                          y  = mat .random( 10,  HH -10 ),
                         vx  = mat .random( -50,  50 ),
                         vy  = mat .random( -50,  50 )  }

  setmetatable( instance,  meta )
  return instance
end -- cir

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

return enemy
