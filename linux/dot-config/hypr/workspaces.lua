-- Main monitor workspaces
for i = 1, 5 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "DP-1",
		layout = "master",
	})
end

-- Second monitor workspaces
for i = 6, 10 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "DP-2",
		layout = "scrolling",
		layout_opts = { direction = "down" },
	})
end
