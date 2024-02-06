# mark-radar.nvim

Scan and highlight all marks in your buffer.

![Demo for using mark-radar](./static/mark_radar_demo.gif)

## Installation

### Requirements

-   Neovim version 0.5 or newer.

### Plugin Managers

<details>
<summary><code>lazy.nvim</code></summary>

```lua
{
    'winston0410/mark-radar.nvim',
    config = function()
        require('mark-radar').setup({
            -- options
        })
    end,
}
```

</details>

<details>
<summary><code>paq.nvim</code></summary>

```lua
paq{'winston0410/mark-radar.nvim'}
```

</details>

<details>
<summary><code>packer.nvim</code></summary>

```lua
use
{
    'winston0410/mark-radar.nvim',
    require("mark-radar").setup{
        -- your options here, such as:
        -- highlight_group = "<group_name>"
   }
}
```

</details>

<details>
<summary><code>vim-plug</code></summary>

```vim
Plug 'winston0410/mark-radar.nvim'
```

</details>

### More Information

After you have installed, call `setup` to start using this plugin.

```lua
require("mark-radar").setup()
```

## Configuration

This is the default configuration.

```lua
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

```lua
require("mark-radar").setup(opts)
```

Possible values for `text_position` are `"eol"`, `"overlay"`, `"right_align"`,
and `"inline"`. See the `virt_text_pos` description in `:h nvim_buf_set_extmark`
for more information.

## Usage

The default mappings to activate mark-radar are the backtick/grave key
(<kbd>\`</kbd>) and the apostrophe key (<kbd>'</kbd>). See `:h mark-motions` for
details.

## Inspiration

This plugin is greatly inspired by
[`hop.nvim`](https://github.com/phaazon/hop.nvim)
