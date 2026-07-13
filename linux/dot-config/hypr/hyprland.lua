require("workspaces")
require("autostart")
require("keybinds")
require("monitors")
require("permissions")
require("input")
require("looknfeel")
require("animations")
require("layouts")
require("windowrules")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("PATH", "/home/juuso/.bin:" .. (os.getenv("PATH") or ""))

-- ghostty dead keys "fix" https://github.com/ghostty-org/ghostty/discussions/8899
hl.env("GTK_IM_MODULE", "ibus")
hl.env("QT_IM_MODULE", "ibus")
hl.env("XMODIFIERS", "@im=ibus")
----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})
