require("txt_display")
require("random_functions")
require("domichoose")

t = 0 -- time since launch

function init_game()
  txt_displayer_init()
  init_domichoose()
end

function update_game(dt)
  t = t + dt
end

function draw_game()

  color(.2, 0, .2)
  fill_rect(0, 0, GW, GH)
  color(1, 1, 1)
  
  if txt_display_on then
    txt_display()
    hide_background() 
    return  
  end
    
  
end