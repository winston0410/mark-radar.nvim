# mark-radar.nvim

Scan and highlight all marks in your buffer.

![Demo for using mark-radar](./static/mark_radar_demo.gif)

## Installation

### `paq.nvim`

```shell
paq{'winston0410/mark-radar.nvim'}
```

### `packer.nvim`

```shell
use
{
    'winston0410/mark-radar.nvim',
    require("mark-radar").setup{
        -- your options here, such as:
        -- highlight_group = "<group_name>"
   }
}
```

### `vim-plug`

```shell
Plug 'winston0410/mark-radar.nvim'
```

After you have installed, call `setup` to start using this plugin.

```shell
require("mark-radar").setup()
```

## Configuration

This is the default configuration.

```shell
local opts = {
    set_default_mappings = true,
    highlight_group = "RadarMark",
    background_highlight = true,
    background_highlight_group = "RadarBackground",
    text_position = "overlay",
    show_marks_at_jump_positions = true,
}
```

You can pass a table in `setup()` to override the default configuration.

```shell
    require("mark-radar").setup(opts)
```

Possible values for text_position are `"eol"`, `"overlay"`, `"right_align"`, and `"inline"`. See the `virt_text_pos` description in `:h nvim_buf_set_extmark` for more information.

## Usage

The default mappings to activate mark-radar are the `` backtick/grave key (`) `` and the `apostrophe key (')`

## Inspiration

This plugin is greatly inspired by [`hop.nvim`](https://github.com/phaazon/hop.nvim)
