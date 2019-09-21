function color(...) love.graphics.setColor(...) end

function fill_rect(...) love.graphics.rectangle("fill", ...) end
function lprint(...) love.graphics.print(...) end

function draw(...) love.graphics.draw(...) end

function setNewFont(...) love.graphics.setNewFont(...) end

function str_width(str)
  str = str or ""
  return love.graphics.getFont():getWidth(str)
end
function str_height(str)
  str = str or ""
  return love.graphics.getFont():getHeight(str)
end

function rnd(...) return love.math.random(...) end
function irnd(...) return math.floor(love.math.random(...)) end

function cos(...) return math.cos(...) end
function sin(...) return math.sin(...) end

function max(...) return math.max(...) end
function min(...) return math.min(...) end

function math.sign(n) return n>0 and 1 or n<0 and -1 or 0 end

function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end
function dist( x1, y1, x2, y2) return math.sqrt ((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))end

function table.clone(org) return {table.unpack(org)} end

function copy(obj)
  if type(obj) ~= 'table' then return obj end
  local res = setmetatable({}, getmetatable(obj))
  for k, v in pairs(obj) do res[copy(k)] = copy(v) end
  return res
end

function mouse_is_down(...) return love.mouse.isDown(...) end

function hide_background(col)
  col = col or {0, 0, 0}
    
  color(col)  
  local w = love.graphics.getWidth() / zoom
  local h = love.graphics.getHeight() / zoom
  
  fill_rect(0, 0, -w, -h)
  fill_rect(0, 0, -w,  h)
  fill_rect(0, 0,  w, -h)
  
  fill_rect(GW, GH,  w,  h)
  fill_rect(GW, GH,  w, -h)
  fill_rect(GW, GH, -w,  h)  

end