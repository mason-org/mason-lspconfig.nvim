[![GitHub CI](https://github.com/williamboman/mason-lspconfig.nvim/workflows/Tests/badge.svg)](https://github.com/williamboman/mason-lspconfig.nvim/actions?query=workflow%3ATests+branch%3Amain+event%3Apush)
![Platforms](https://img.shields.io/badge/platform-linux%20macOS%20windows-blue)
![Repository size](https://img.shields.io/github/repo-size/williamboman/mason-lspconfig.nvim)
[![Sponsors](https://img.shields.io/github/sponsors/williamboman?style=flat-square)](https://github.com/sponsors/williamboman)

# mason-lspconfig.nvim

<p align="center">
    <code>mason-lspconfig</code> bridges <a
    href="https://github.com/williamboman/mason.nvim"><code>mason.nvim</code></a> with the <a
    href="https://github.com/neovim/nvim-lspconfig"><code>lspconfig</code></a> plugin - making it easier to use the both
    plugins together.
</p>

# Table of Contents

-   [Introduction](#introduction)
-   [Requirements](#requirements)
-   [Installation](#installation)
-   [Setup](#setup)
-   [Commands](#commands)
-   [Configuration](#configuration)

# Introduction

`mason-lspconfig.nvim` closes some gaps that exist between `mason.nvim` and `lspconfig`. Its main responsibilities is
to:

-   register a setup hook with `lspconfig` that ensures servers installed with `mason.nvim` are set up with the necessary
    configuration
-   provide extra convenience APIs such as the `:LspInstall` command
-   allow you to (i) automatically install, and (ii) automatically set up a predefined list of servers
-   translate between `lspconfig` server names and `mason.nvim` package names (e.g. `sumneko_lua <-> lua-language-server`)

It is recommended to use this extension if you use `mason.nvim` and `lspconfig` (it's strongly recommended for Windows
users).

**Note: this plugin uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names. [See this
table for a complete mapping.](./doc/server-mapping.md)**

# Requirements

-   neovim `>= 0.7.0`
-   `mason.nvim`
-   `lspconfig`

# Installation

## [Packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
```

## vim-plug

```vim
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
```

# Setup

```lua
require("mason").setup()
require("mason-lspconfig").setup()
```

Refer to the [Configuration](#configuration) section for information about which settings are available.

# Commands

-   `:LspInstall [<server>...]` - installs the provided servers
-   `:LspUninstall <server> ...` - uninstalls the provided servers

# Configuration

You may optionally configure certain behavior of `mason-lspconfig.nvim` when calling the `.setup()` function. Refer to
the [default configuration](#default-configuration) for a list of all available settings.

Example:

```lua
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer" }
})
```

## Default configuration

```lua
local DEFAULT_SETTINGS = {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = {},

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = false,
}
```
