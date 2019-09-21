text_displayer = { -- command lines like display 
    lines = {}, -- list of lines
    interlines = 7,
    font_size = 16,
    top_displayed_ind = 1,
    max_lines_on_s = 0,
    -- scroll_perc = 0 -- scroll percentage to see old messages on screen
}

txt_display_on = false -- set in init  
std_height = 0 -- set in init

function txt_displayer_init()
  std_height = str_height("!")
  text_displayer.max_lines_on_s = math.floor(GH / (std_height+ text_displayer.interlines)) - 1
  setNewFont(text_displayer.font_size)
  love.graphics.setNewFont(text_displayer.font_size)
  txt_display_on = true
  
  
  print("text_displayer.max_lines_on_s = " .. text_displayer.max_lines_on_s)
    
end

function write(string)
  if not string then return end
  table.insert(text_displayer.lines, string)
  if (#text_displayer. lines - text_displayer. top_displayed_ind) > text_displayer.max_lines_on_s then 
    text_displayer. top_displayed_ind = text_displayer. top_displayed_ind + 1 
  end
end

function txt_display()
  for i = text_displayer.top_displayed_ind, #text_displayer.lines  do
    love.graphics.print( text_displayer.lines[ i ], 11,  (i - text_displayer.top_displayed_ind)  * ( std_height + text_displayer.interlines ) + 4)
  end
  color(.2, .2, .2)
  fill_rect(0, 0, 10, GH) 
  color(1, 1, 1)
  fill_rect( 0, 
             (text_displayer.top_displayed_ind - 1 ) / (#text_displayer.lines) * GH, 
             10, 
             text_displayer.max_lines_on_s / (#text_displayer.lines - 1) * GH) 
end
