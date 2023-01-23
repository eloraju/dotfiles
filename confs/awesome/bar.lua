-- Aesome widget collection widgets
local cal_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
-- Widget and layout library
local wibox = require("wibox")

local utils = require("utils")

local bar = {
	init = function(screen, awful, client)

		-- {{{ Wibar

		-- Create calendar widget
		calendar = cal_widget({
			placement = "top_middle",
			theme = "dark"
		})

		-- Get hostname and check if we're running on the laptop
		hasBattery = io.popen("uname -n"):read() == "cruiser"

		-- Create a textclock widget
		mytextclock = wibox.widget.textclock('%a %d.%m. %H:%M')

		-- Connect calendar widget to click
		mytextclock:connect_signal("button::press", function(_, _, _, btn)
			if btn == 1 then calendar.toggle() end
		end)

		screen.connect_signal("request::wallpaper", utils.setWallpaper)
		screen.connect_signal("request::desktop_decoration", function(s)
			-- Each screen has its own tag table.
			awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

			-- Create an imagebox widget which will contain an icon indicating which layout we're using.
			-- We need one layoutbox per screen.
			s.mylayoutbox = awful.widget.layoutbox {
				screen  = s,
				buttons = {
					awful.button({}, 1, function() awful.layout.inc(1) end),
					awful.button({}, 3, function() awful.layout.inc(-1) end),
					awful.button({}, 4, function() awful.layout.inc(-1) end),
					awful.button({}, 5, function() awful.layout.inc(1) end),
				}
			}

			-- Create a taglist widget
			s.mytaglist = awful.widget.taglist {
				screen  = s,
				filter  = awful.widget.taglist.filter.all,
				buttons = {
					awful.button({}, 1, function(t) t:view_only() end),
					awful.button({ modkey }, 1, function(t)
						if client.focus then
							client.focus:move_to_tag(t)
						end
					end),
					awful.button({}, 3, awful.tag.viewtoggle),
					awful.button({ modkey }, 3, function(t)
						if client.focus then
							client.focus:toggle_tag(t)
						end
					end),
					awful.button({}, 4, function(t) awful.tag.viewprev(t.screen) end),
					awful.button({}, 5, function(t) awful.tag.viewnext(t.screen) end),
				}
			}

			-- Create a tasklist widget
			s.mytasklist = awful.widget.tasklist {
				screen  = s,
				filter  = awful.widget.tasklist.filter.currenttags,
				buttons = {
					-- minimize/un-minimize application from task list
					awful.button({}, 1, function(c)
						c:activate { context = "tasklist", action = "toggle_minimization" }
					end),
					-- list all applications
					awful.button({}, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
					awful.button({}, 4, function() awful.client.focus.byidx(-1) end),
					awful.button({}, 5, function() awful.client.focus.byidx(1) end),
				}
			}

  -- Create the wibox
  s.mywibox = awful.wibar {
    position = "top",
    screen   = s,
    height   = 25,
    widget   = {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
          layout = wibox.layout.fixed.horizontal,
          spacing = 5,
          s.mylayoutbox,
          s.mytaglist,
        },
          s.mytasklist,
        { -- Right widgets
          layout = wibox.layout.fixed.horizontal,
	  (hasBattery and battery_widget({show_current_level = true}) or nil),
          wibox.widget.systray(),
        mytextclock,
        },
    }
  }
end)
-- }}}
	end
}

return bar;
