-------------------------------------------------
-- clock and layout
-------------------------------------------------

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local naughty = require("naughty")
local theme_assets = require("beautiful.theme_assets")
local string, os = string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme                                     = {}



local mytextclock = wibox.widget.textclock(markup("#fffede", "   %H:%M "))
local clockbg = wibox.container.background(mytextclock, borders_color, gears.shape.rectangle)
local clockwidget = wibox.container.margin(clockbg, dpi(0), dpi(3), dpi(5), dpi(5))
s.mylayoutbox = awful.widget.layoutbox(s)

mento = wibox.widget{
	clockwidget,
	s.mylayoutbox,
        layout = wibox.layout.fixed.horizontal,
}

mentobox =  wibox.container.background( mento, (borders_color), gears.shape.octogon ) -- clock & layoutbox with shape

bentobox = wibox.widget{{
	    left   = 0,
            right  = 0,
            top    = 40,
            bottom = 0,
            widget = wibox.container.margin
        },
mentobox,
layout = wibox.layout.fixed.horizontal
}

function set_tag_color1()
borders_color = "#719901" .. "55"
mentobox:set_bg(borders_color)
end

function set_tag_color2()
borders_color = "#ACAA01" .. "55"
mentobox:set_bg(borders_color)
end

function set_tag_color3()
borders_color = "#6AC8C0" .. "55"
mentobox:set_bg(borders_color)
end

function set_tag_color4()
borders_color = "#0038C6" .. "55"
mentobox:set_bg(borders_color)
end

function set_tag_color5()
borders_color = "#C8030F" .. "55"
mentobox:set_bg(borders_color)
end

screen[1]:connect_signal("tag1", set_tag_color1 )
screen[1]:connect_signal("tag2", set_tag_color2 )
screen[1]:connect_signal("tag3", set_tag_color3 )
screen[1]:connect_signal("tag4", set_tag_color4 )
screen[1]:connect_signal("tag5", set_tag_color5 )
screen[1]:connect_signal("tag6", set_tag_color3 )
screen[1]:connect_signal("tag7", set_tag_color5 )
screen[1]:connect_signal("tag8", set_tag_color3 )
screen[1]:connect_signal("tag9", set_tag_color3 )



	-- Export the widget
return bentobox

