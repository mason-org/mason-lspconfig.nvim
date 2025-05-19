![Linux](https://img.shields.io/badge/Linux-%23.svg?logo=linux&color=FCC624&logoColor=black)
![macOS](https://img.shields.io/badge/macOS-%23.svg?logo=apple&color=000000&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-%23.svg?logo=windows&color=0078D6&logoColor=white)
[![GitHub CI](https://github.com/mason-org/mason-lspconfig.nvim/workflows/Tests/badge.svg)](https://github.com/mason-org/mason-lspconfig.nvim/actions?query=workflow%3ATests+branch%3Amain+event%3Apush)
[![Sponsors](https://img.shields.io/github/sponsors/mason-org?style=flat-square)](https://github.com/sponsors/mason-org)

<h1 align="center">mason-lspconfig.nvim</h1>

<p align="center">
    <code>mason-lspconfig</code> bridges <a
    href="https://github.com/mason-org/mason.nvim"><code>mason.nvim</code></a> with the <a
    href="https://github.com/neovim/nvim-lspconfig"><code>lspconfig</code></a> plugin - making it easier to use both
    plugins together.
</p>
<p align="center">
    <code>:help mason-lspconfig.nvim</code>
</p>
<p align="center">
    <sup>Latest version: v2.0.0</sup> <!-- x-release-please-version -->
</p>

## Table of Contents

- [Introduction](#introduction)
- [Requirements](#requirements)
- [Installation & Usage](#installation--usage)
    - [Recommended setup for `lazy.nvim`](#recommended-setup-for-lazynvim)
- [Automatically enable installed servers](#automatically-enable-installed-servers)
- [Commands](#commands)
- [Configuration](#configuration)
  - [Default configuration](#default-configuration)

## Introduction

> `:h mason-lspconfig-introduction`

This plugin's main responsibilities are to:

- allow you to (i) automatically install, and (ii) automatically enable (`vim.lsp.enable()`) installed servers
- provide extra convenience APIs such as the `:LspInstall` command
- provide additional LSP configurations for a few servers
- translate between `nvim-lspconfig` server names and `mason.nvim` package names (e.g. `lua_ls <-> lua-language-server`)

> [!NOTE]
> Since the introduction of [`:h vim.lsp.config`](https://neovim.io/doc/user/lsp.html#vim.lsp.config()) in Neovim 0.11,
> this plugin's feature set has been reduced. Use this plugin if you want to automatically enable installed servers
> ([`:h vim.lsp.enable()`](https://neovim.io/doc/user/lsp.html#vim.lsp.enable())) or have access to the `:LspInstall`
> command.

## Requirements

> `:h mason-lspconfig-requirements`

- `neovim >= 0.11.0`
- `mason.nvim >= 2.0.0`
- `nvim-lspconfig >= 2.0.0`

## Installation & Usage

> `:h mason-lspconfig-quickstart`

Install using your plugin manager of choice. **Setup is required**:

```lua
require("mason-lspconfig").setup()
```

It's important that you set up `mason.nvim` _and_ have `nvim-lspconfig` available in [`:h
runtimepath`](https://neovim.io/doc/user/options.html#'runtimepath') before setting up `mason-lspconfig.nvim`.

Refer to the [Configuration](#configuration) section for information about which settings are available.

### Recommended setup for `lazy.nvim`

The following is the recommended setup when using `lazy.nvim`. It will set up the plugin for you, meaning **you don't have
to call `require("mason-lspconfig").setup()` yourself**.

```lua
{
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
```

## Automatically enable installed servers

`mason-lspconfig.nvim` will automatically enable (`vim.lsp.enable()`) installed servers for you by default.

To disable this feature:

```lua
require("mason-lspconfig").setup {
    automatic_enable = false
}
```

To exclude certain servers from being enabled:

```lua
require("mason-lspconfig").setup {
    automatic_enable = {
        exclude = {
            "rust_analyzer",
            "ts_ls"
        }
    }
}
```

Alternatively, to only enable specific servers:

```lua
require("mason-lspconfig").setup {
    automatic_enable = {
        "lua_ls",
        "vimls"
    }
}
```

> [!NOTE]
> This will only enable servers that are installed via Mason. It will not recognize servers installed elsewhere on your
> system.

## Commands

> `:h mason-lspconfig-commands`

- `:LspInstall [<server> ...]`: Installs the provided servers. If no server is provided you will be prompted to select a
  server based on the current buffer's `&filetype`.
- `:LspUninstall <server> ...`: Uninstalls the provided servers.

## Configuration

> `:h mason-lspconfig-settings`

You may optionally configure certain behavior of `mason-lspconfig.nvim` when calling the `.setup()` function. Refer to
the [default configuration](#default-configuration) for a list of all available settings.

Example:

```lua
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer" },
}
```

### Configuration using `lazy.nvim`

```lua
{
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "lua_ls", "rust_analyzer" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
```


### Default configuration

```lua
local DEFAULT_SETTINGS = {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
    ---@type string[]
    ensure_installed = {},

    -- Whether installed servers should automatically be enabled via `:h vim.lsp.enable()`.
    --
    -- To exclude certain servers from being automatically enabled:
    -- ```lua
    --   automatic_enable = {
    --     exclude = { "rust_analyzer", "ts_ls" }
    --   }
    -- ```
    --
    -- To only enable certain servers to be automatically enabled:
    -- ```lua
    --   automatic_enable = {
    --     "lua_ls",
    --     "vimls"
    --   }
    -- ```
    ---@type boolean | string[] | { exclude: string[] }
    automatic_enable = true,
}
```
