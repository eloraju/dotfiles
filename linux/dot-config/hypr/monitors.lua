------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "DP-1",
	mode = "3840x2160@60.00Hz",
	position = "0x0",
	scale = 1,
})
hl.monitor({
	output = "DP-2",
	mode = "3840x2160@60.00Hz",
	position = "3840x-360",
	scale = 1,
	transform = 3,
})
