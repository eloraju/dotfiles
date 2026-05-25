---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "hyprlauncher"
local bluetooth = "bluetui"
local netowrk = "impala"

---------------------
---- KEYBINDINGS ----
---------------------

local Mod = "SUPER + " -- Sets "Windows" key as main modifier
local Shift = "SHIFT + "
local Ctrl = "CTRL + "
local SMod = Mod .. Shift
local CMod = Mod .. Ctrl
local CSMod = SMod .. Ctrl

local quitHyprland = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(Mod .. "Return", hl.dsp.exec_cmd(terminal))
hl.bind(SMod .. "Q", hl.dsp.window.close())
hl.bind(Mod .. "M", hl.dsp.exec_cmd(quitHyprland))
hl.bind(CSMod .. "Q", hl.dsp.exec_cmd(quitHyprland))
hl.bind(CMod .. "L", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind(Mod .. "E", hl.dsp.exec_cmd(fileManager))
hl.bind(Mod .. "V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(SMod .. "Return", hl.dsp.exec_cmd(menu))
hl.bind(Mod .. "P", hl.dsp.window.pseudo())

-- Move focus with mainMod + hjkl
hl.bind(Mod .. "H", hl.dsp.focus({ direction = "left" }))
hl.bind(Mod .. "L", hl.dsp.focus({ direction = "right" }))
hl.bind(Mod .. "K", hl.dsp.focus({ direction = "up" }))
hl.bind(Mod .. "J", hl.dsp.focus({ direction = "down" }))

-- Move windows with SMod + hjkl
hl.bind(SMod .. "H", hl.dsp.window.move({ direction = "left" }))
hl.bind(SMod .. "L", hl.dsp.window.move({ direction = "right" }))
hl.bind(SMod .. "K", hl.dsp.window.move({ direction = "up" }))
hl.bind(SMod .. "J", hl.dsp.window.move({ direction = "down" }))

-- Switch monitor
hl.bind(Mod .. "O", hl.dsp.focus({ monitor = "+1" }))
-- Move window to monitor
hl.bind(SMod .. "O", hl.dsp.window.move({ monitor = "+1" }))

-- Applications
hl.bind(SMod .. "B", hl.dsp.exec_cmd("impala")) --needs a floating terminal
hl.bind(SMod .. "B", hl.dsp.exec_cmd("bluetui")) --needs a floating terminal

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(Mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(SMod .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(Mod .. "S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(SMod .. "S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(Mod .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(Mod .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(Mod .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(Mod .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
