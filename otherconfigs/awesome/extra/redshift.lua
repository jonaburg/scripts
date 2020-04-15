-------------------------------------------------
-- red shifter
-------------------------------------------------
local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local math, string, tag, tonumber, type, os = math, string, tag, tonumber, type, os
local naughty = require("naughty")
local theme_assets = require("beautiful.theme_assets")
local string, os = string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme                                     = {}


--redshift_bar {
--    {
--        max_value     = 1,
--        value         = 0.5,
--        forced_height = 20,
--        forced_width  = 100,
--        paddings      = 1,
--        border_width  = 1,
--        border_color  = beautiful.border_color,
--        widget        = wibox.widget.progressbar,
--    },
--    {
--        text   = '50%',
--        widget = wibox.widget.textbox,
--    },
--    layout = wibox.layout.stack
--}
--
--
-- Create the text widget
local temp_text = wibox.widget{
	    font = "Inconsolata 9",
	        widget = wibox.widget.textbox,
	}

local red_baroo = wibox.widget{
        max_value     = 1,
        value         = 0.5,
        forced_height = 20,
        forced_width  = 100,
        paddings      = 1,
        border_width  = 1,
        border_color  =  "#ff0000",
        widget        = wibox.widget.progressbar,
    }


	-- Create the background widget
	local temp_widget = wibox.widget.background()
	temp_widget:set_widget(temp_text) -- Put the text inside of it

	-- Set the colors and some text
	temp_widget:set_bg("#4d5eff")  -- Green background
	temp_widget:set_fg("#1d1d1d")  -- White text
	temp_text:set_text("this is temporary")

	-- Export the widget
	return red_baroo

