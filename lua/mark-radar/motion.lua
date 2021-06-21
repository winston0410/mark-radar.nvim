local function jump(mark_list, str, to_column)
	for _, mark in ipairs(mark_list) do
		if str == mark.mark:sub(2) then
			local line, col = mark.pos[2], mark.pos[3] - 1
            local target_col = to_column and col or 0
            vim.api.nvim_win_set_cursor(0, { line, target_col })
		end
	end
end

return {
	jump = jump,
}
