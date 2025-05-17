require("silicon").setup({
	disable_defaults = false,
	debug = false,
	font = "VictorMono",
	theme = "kanagawa",
	background = nil,
	background_image = nil,
	pad_horiz = 100,
	pad_vert = 80,
	no_round_corner = false,
	no_window_controls = false,
	no_line_number = false,
	line_offset = 1,
	line_pad = 0,
	tab_width = 4,
	language = function()
		return vim.bo.filetype
	end,
	shadow_blur_radius = 16,
	shadow_offset_x = 8,
	shadow_offset_y = 8,
	shadow_color = nil,
	gobble = true,
	num_separator = nil,
	to_clipboard = false,
	window_title = nil,
	command = "silicon",
	output = function()
		return "~/Pictures/Screenshots/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
	end,
    
})
