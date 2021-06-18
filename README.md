# mark-radar.nvim

Scan and highlight all marks in your buffer.

![Demo for using mark-radar](./static/mark_radar_demo.gif)

## Installation

### `paq.nvim`

```shell
paq{'winston0410/mark-radar.nvim'}
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
}
```

You can pass a table in `setup()` to override the default configuration.

```shell
    require("mark-radar").setup()
```

## Inspiration

This plugin is greatly inspired by [`hop.nvim`](https://github.com/phaazon/hop.nvim)
