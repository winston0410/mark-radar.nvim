local opts = require("mark-radar.opts")
local motion = require("mark-radar.motion")

local ns = vim.api.nvim_create_namespace("mark-radar")

local function setup(user_opts)
	opts = vim.tbl_extend("force", opts, user_opts or {})
	vim.api.nvim_command("highlight default RadarMark guifg=#ff007c gui=bold ctermfg=198 cterm=bold")
	vim.api.nvim_command("highlight default RadarBackground guifg=#666666 ctermfg=242")
	local modes = { "n", "v" }
	if opts.set_default_mappings then
		for _, mode in ipairs(modes) do
			vim.api.nvim_set_keymap(
				mode,
				"`",
				"<cmd>lua require('mark-radar').scan(true)<cr>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_set_keymap(
				mode,
				"'",
				"<cmd>lua require('mark-radar').scan(false)<cr>",
				{ silent = true, noremap = true }
			)
		end
	end
end

local function highlight_marks(mark_list, top_line, bottom_line)
	for _, mark in ipairs(mark_list) do
		local line, col = mark.pos[2] - 1, mark.pos[3] - 1
		local column_count = string.len(vim.api.nvim_buf_get_lines(0, line, line + 1, false)[1])
		if line < bottom_line and col < column_count then
			local extmark_id = vim.api.nvim_buf_set_extmark(0, ns, line, col, {
				virt_text = { { mark.mark:sub(2), opts.highlight_group } },
				virt_text_pos = opts.text_position,
				priority = 200,
			})
		end
	end

	vim.cmd("redraw")
end

local function clean_up(top_line, bottom_line)
	vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
end

local function scan(jump_to_column)
	local win_info = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1]
	local top_line, bottom_line = win_info.topline, win_info.botline
	local bottom_line_column_count = string.len(vim.api.nvim_buf_get_lines(0, bottom_line - 1, bottom_line, false)[1])

	local mark_list = vim.fn.getmarklist(1)

	local input = nil

	if opts.background_highlight then
		vim.highlight.range(
			0,
			ns,
			opts.background_highlight_group,
			{ top_line - 1, 0 },
			{ bottom_line, bottom_line_column_count },
			"V",
			false
		)
	end

	highlight_marks(mark_list, top_line, bottom_line)

	while not input do
		local ok, key = pcall(vim.fn.getchar)
		if not ok then
			clean_up(top_line, bottom_line)
			break
		end

		if type(key) == "number" then
			local key_str = vim.fn.nr2char(key)
			motion.jump(mark_list, key_str, jump_to_column)
			-- vim.api.nvim_feedkeys(key_str, "", true)
			break
		end
	end

	clean_up(top_line, bottom_line)
end

return {
	setup = setup,
	scan = scan,
}
