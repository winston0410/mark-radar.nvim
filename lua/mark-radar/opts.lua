local opts = {
    set_default_mappings = true,
    mappings = {
        exact_position_jump_key = '`',
        start_of_line_jump_key = "'",
    },
    highlight_group = 'RadarMark',
    background_highlight = true,
    background_highlight_group = 'RadarBackground',
    text_position = 'overlay',
    show_marks_at_jump_positions = true,
    show_off_screen_marks = true,
    pre_scan_hook = nil,
    post_clean_up_hook = nil,
}

return opts
