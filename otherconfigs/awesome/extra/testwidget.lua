-------------------------------------------------
--some image of the great british destruction bout to go down.
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local testwidget_widget = {}
local bgicon = '/home/jon/.config/awesome/themes/spring/icons/maxi.png'



local temp_image = wibox.widget{
	image = bgicon,
	resize = true,
        widget = wibox.widget.imagebox,
}

local temp_text = wibox.widget{
    		font = "Inconsolata 9",
    		widget = wibox.widget.textbox,
	}


temp_text:set_text("bonus")

local temp_widget = wibox.widget.background()
temp_widget:set_widget(temp_image)
--temp_widget:set_widget(temp_text)
--temp_widget:add(temp_text)



return temp_widget
