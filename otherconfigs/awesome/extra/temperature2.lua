-------------------------------------------------
-- Temperature widget
-------------------------------------------------

local wibox = require("wibox")  -- Provides the widgets
local watch = require("awful.widget.watch")  -- For periodic command execution
local lain  = require("lain")
local markup = lain.util.markup

-- Create the text widget
local temp_text = wibox.widget{
    font = "inconsolata 9",
    widget = wibox.widget.textbox,
}

-- Create the background widget
local temp_widget = wibox.widget.background()
temp_widget:set_widget(temp_text)

-- Set the base colors (will be immediately replaced)
temp_widget:set_bg("#008800")  -- Green background
temp_widget:set_fg("#ffffff")  -- White text

watch(
  "uptime", 60,
  function(_, stdout, stderr, exitreason, exitcode)
    local temp = nil

    -- This loop matches the groups number(s).number(s)
    -- each pair is converted to a number and saved on `temp`
    -- (Only the last group is kept)
    for str in string.gmatch(stdout, "([0-9]+.[0-9]+)") do
      temp = tonumber(str)
    end

    -- Set that as text (not just the raw command)
    temp_text:set_text(" " .. temp .. " 💹 ")
--    temp_text:set_markup(markup("#ff2222", " " .. temp .. markup("#000000", " 💹 ")))
    temp_text:set_markup(markup("#000000", " " .. temp .. markup("#000000", " 💹 ")))
end,
  temp_widget
)

temp_text:set_text(" ??? ")

-- Export the widget
return temp_widget

