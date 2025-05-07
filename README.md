![Linux](https://img.shields.io/badge/Linux-%23.svg?logo=linux&color=FCC624&logoColor=black)
![macOS](https://img.shields.io/badge/macOS-%23.svg?logo=apple&color=000000&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-%23.svg?logo=windows&color=0078D6&logoColor=white)
[![GitHub CI](https://github.com/mason-org/mason-lspconfig.nvim/workflows/Tests/badge.svg)](https://github.com/mason-org/mason-lspconfig.nvim/actions?query=workflow%3ATests+branch%3Amain+event%3Apush)
[![Sponsors](https://img.shields.io/github/sponsors/mason-org?style=flat-square)](https://github.com/sponsors/mason-org)

# mason-lspconfig.nvim

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

# Table of Contents

- [Introduction](#introduction)
- [Requirements](#requirements)
- [Installation](#installation)
- [Setup](#setup)
- [Automatically enable installed servers](#automatically-enable-installed-servers)
- [Commands](#commands)
- [Configuration](#configuration)
  - [Default configuration](#default-configuration)

# Introduction

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

# Requirements

> `:h mason-lspconfig-requirements`

- `neovim >= 0.11.0`
- `mason.nvim >= 2.0.0`
- `nvim-lspconfig >= 2.0.0`

# Installation

## [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
```

## vim-plug

```vim
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
```

# Setup

> `:h mason-lspconfig-quickstart`

It's important that you set up `mason.nvim` _and_ have `nvim-lspconfig` available in [`:h
runtimepath`](https://neovim.io/doc/user/options.html#'runtimepath') before setting up `mason-lspconfig.nvim`.

Refer to the [Configuration](#configuration) section for information about which settings are available.

# Automatically enable installed servers

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

# Commands

> `:h mason-lspconfig-commands`

- `:LspInstall [<server> ...]`: Installs the provided servers. If no server is provided you will be prompted to select a
  server based on the current buffer's `&filetype`.
- `:LspUninstall <server> ...`: Uninstalls the provided servers.

# Configuration

> `:h mason-lspconfig-settings`

You may optionally configure certain behavior of `mason-lspconfig.nvim` when calling the `.setup()` function. Refer to
the [default configuration](#default-configuration) for a list of all available settings.

Example:

```lua
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer" },
}
```

## Default configuration

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

## Example configuration

This example for [lazy.nvim](https://github.com/folke/lazy.nvim) sets up almost all you need to make the LSP work in neovim.

It adds nvim-lspconfig, mason and sets up lua lsp so you can use lsp to edit neovim lua files.

I also sets up some convenient keybindings.

first, save as lua/plugins/lsp.lua

```lua
return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    ensure_installed = {
      -- auto install lua lsp to use lsp in neovim config
      "lua_ls",
    },
    config = function()
      -- setup mason
      require("mason").setup()

      -- Set LSP keymaps on LSP attach event
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "Set LSP keymaps",
        callback = function(event)
          -- Default keymaps See :help lsp-defaults
          -- "grn" is mapped in Normal mode to vim.lsp.buf.rename()
          -- "gra" is mapped in Normal and Visual mode to vim.lsp.buf.code_action()
          -- "grr" is mapped in Normal mode to vim.lsp.buf.references()
          -- "gri" is mapped in Normal mode to vim.lsp.buf.implementation()
          -- "gO" is mapped in Normal mode to vim.lsp.buf.document_symbol()
          -- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()

          local opts = { noremap = true, silent = true, buffer = event.buf }
          -- Hover information
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          -- Jump to definition
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          -- Jump to declaration
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          -- Jump to type definition
          vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
          -- Show diagnostics in floating window
          vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
          -- Move to previous diagnostic
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          -- Move to next diagnostic
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })

      -- finally, setup other lsp servers
      require("mason-lspconfig").setup()
    end,
  },
}
```

then add this to `lsp/lua_ls.lua` so nvim recognizes "vim" as a global

```lua
-- special lua_ls config so vim is registered as global and don't show warnings
return {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
```


That's it!

add new LSP with command `:Mason` [read more](https://github.com/mason-org/mason.nvim)
