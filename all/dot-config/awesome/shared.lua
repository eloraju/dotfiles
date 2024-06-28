local shared = {
	conf = {},
	scripts = {},
	layouts = function (awful)
		return {
			awful.layout.suit.tile,
			awful.layout.suit.tile.bottom,
			awful.layout.suit.tile.left,
			awful.layout.suit.tile.top,
			awful.layout.suit.corner.nw,
			awful.layout.suit.fair,
			awful.layout.suit.fair.horizontal,
			awful.layout.suit.magnifier,
		} end
}

shared.conf.terminal = "alacritty"
shared.conf.editor = "nvim"
shared.conf.browser = "brave"
shared.conf.browser_incognito = "brave --incognito"
shared.conf.ide = "intellij-idea-ultimate-edition"
shared.conf.wp_dir = "~/pictures/wallpapers"

shared.scripts.screenshot = "~/.local/user/scripts/screenshot"
shared.scripts.fs_screenshot = "~/.local/user/scripts/screenshot -f"
shared.scripts.randomWP = "~/.local/user/scripts/setwp -r"
shared.scripts.suspend = "systemctl suspend"
-- sudo is conffed not to ask password for this command
shared.scripts.inc_backlight = "sudo light -A 10"
shared.scripts.dec_backlight = "sudo light -U 10"
shared.scripts.run_rofi = "rofi -show run"

return shared
