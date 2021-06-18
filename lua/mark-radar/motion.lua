local function jump(mark_list, str)
	for _, mark in ipairs(mark_list) do
		if str == mark.mark:sub(2) then
			local line, col = mark.pos[2], mark.pos[3] - 1
            vim.api.nvim_win_set_cursor(0, { line, col })
		end
	end
end

return {
	jump = jump,
}
