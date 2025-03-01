![Linux](https://img.shields.io/badge/Linux-%23.svg?logo=linux&color=FCC624&logoColor=black)
![macOS](https://img.shields.io/badge/macOS-%23.svg?logo=apple&color=000000&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-%23.svg?logo=windows&color=0078D6&logoColor=white)
[![GitHub CI](https://github.com/williamboman/mason-lspconfig.nvim/workflows/Tests/badge.svg)](https://github.com/williamboman/mason-lspconfig.nvim/actions?query=workflow%3ATests+branch%3Amain+event%3Apush)
[![Sponsors](https://img.shields.io/github/sponsors/williamboman?style=flat-square)](https://github.com/sponsors/williamboman)

# mason-lspconfig.nvim

<p align="center">
    <code>mason-lspconfig</code> bridges <a
    href="https://github.com/williamboman/mason.nvim"><code>mason.nvim</code></a> with the <a
    href="https://github.com/neovim/nvim-lspconfig"><code>lspconfig</code></a> plugin - making it easier to use both
    plugins together.
</p>
<p align="center">
    <code>:help mason-lspconfig.nvim</code>
</p>
<p align="center">
    <sup>Latest version: v1.32.0</sup> <!-- x-release-please-version -->
</p>

# Table of Contents

- [Introduction](#introduction)
- [Requirements](#requirements)
- [Installation](#installation)
- [Setup](#setup)
  - [Automatic server setup (advanced feature)](#automatic-server-setup-advanced-feature)
- [Commands](#commands)
- [Configuration](#configuration)
  - [Default configuration](#default-configuration)
- [Available LSP servers](#available-lsp-servers)

# Introduction

> `:h mason-lspconfig-introduction`

`mason-lspconfig.nvim` closes some gaps that exist between `mason.nvim` and `lspconfig`. Its main responsibilities are to:

- register a setup hook with `lspconfig` that ensures servers installed with `mason.nvim` are set up with the necessary
    configuration
- provide extra convenience APIs such as the `:LspInstall` command
- allow you to (i) automatically install, and (ii) automatically set up a predefined list of servers
- translate between `lspconfig` server names and `mason.nvim` package names (e.g. `lua_ls <-> lua-language-server`)

It is recommended to use this extension if you use `mason.nvim` and `lspconfig` (it's strongly recommended for Windows
users).

**Note: this plugin uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names. [See this
table for a complete mapping.](./doc/server-mapping.md)**

# Requirements

> `:h mason-lspconfig-requirements`

- neovim `>= 0.9.0`
- `mason.nvim`
- `lspconfig`

# Installation

## [Packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
```

## [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
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

> `:h mason-lspconfig-quickstart`

It's important that you set up the plugins in the following order:

1. `mason.nvim`
2. `mason-lspconfig.nvim`
3. Setup servers via `lspconfig`

Pay extra attention to this if you lazy-load plugins, or somehow "chain" the loading of plugins via your plugin manager.

```lua
require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
```

Refer to the [Configuration](#configuration) section for information about which settings are available.

## Automatic server setup (advanced feature)

> `:h mason-lspconfig-automatic-server-setup`

`mason-lspconfig` provides extra, opt-in, functionality that allows you to automatically set up LSP servers installed
via `mason.nvim` without having to manually add each server setup to your Neovim configuration.
Refer to `:h mason-lspconfig-automatic-server-setup` for more details.

# Commands

> `:h mason-lspconfig-commands`

- `:LspInstall [<server>...]` - installs the provided servers
- `:LspUninstall <server> ...` - uninstalls the provided servers

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
    -- This setting has no relation with the `automatic_installation` setting.
    ---@type string[]
    ensure_installed = {},

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    ---@type boolean
    automatic_installation = false,

    -- See `:h mason-lspconfig.setup_handlers()`
    ---@type table<string, fun(server_name: string)>?
    handlers = nil,
}
```

# Available LSP servers

<!-- available-lsp-servers:start -->
| Language | Server name |
| --- | --- |
| 1С:Enterprise | [`bsl_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bsl_ls) |
| Angular | [`angularls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#angularls) |
| Ansible | [`ansiblels`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ansiblels) |
| Antlers | [`antlersls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#antlersls) |
| Apex | [`apex_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#apex_ls) |
| Arduino | [`arduino_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#arduino_language_server) |
| Assembly | [`asm_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#asm_lsp) |
| Astro | [`astro`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#astro) |
| AWK | [`awk_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#awk_ls) |
| Azure Pipelines | [`azure_pipelines_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#azure_pipelines_ls) |
| Bash | [`bashls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bashls) |
| Bash | [`pkgbuild_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pkgbuild_language_server) |
| bazelrc configuration | [`bazelrc_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bazelrc_lsp) |
| Beancount | [`beancount`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#beancount) |
| Bicep | [`bicep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bicep) |
| Blade | [`stimulus_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#stimulus_ls) |
| BrighterScript | [`bright_script`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bright_script) |
| C# | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| C# | [`csharp_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#csharp_ls) |
| C# | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| C# ([docs](lua/mason-lspconfig/server_configurations/omnisharp/README.md)) | [`omnisharp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#omnisharp) |
| C# | [`omnisharp_mono`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#omnisharp_mono) |
| C++ | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| C++ | [`clangd`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clangd) |
| C++ | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| Cairo | [`cairo_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#cairo_ls) |
| C | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| C | [`clangd`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clangd) |
| C | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| Clarity | [`clarity_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clarity_lsp) |
| Clojure | [`clojure_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clojure_lsp) |
| ClojureScript | [`clojure_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clojure_lsp) |
| CMake | [`cmake`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#cmake) |
| CMake | [`neocmake`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#neocmake) |
| COBOL | [`cobol_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#cobol_ls) |
| CodeQL | [`codeqlls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#codeqlls) |
| Coq | [`coq_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#coq_lsp) |
| Crystal | [`crystalline`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#crystalline) |
| Csh | [`bashls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bashls) |
| CSS | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| CSS | [`css_variables`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#css_variables) |
| CSS | [`cssls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#cssls) |
| CSS | [`cssmodules_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#cssmodules_ls) |
| CSS | [`tailwindcss`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#tailwindcss) |
| CSS | [`unocss`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#unocss) |
| Cucumber | [`cucumber_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#cucumber_language_server) |
| Cue | [`dagger`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#dagger) |
| Cypher | [`cypher_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#cypher_ls) |
| Dart | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| Dhall | [`dhall_lsp_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#dhall_lsp_server) |
| Django | [`jinja_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jinja_lsp) |
| Docker | [`docker_compose_language_service`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#docker_compose_language_service) |
| Docker | [`dockerls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#dockerls) |
| DOT | [`dotls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#dotls) |
| Drools | [`drools_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#drools_lsp) |
| D | [`serve_d`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#serve_d) |
| DTS | [`ginko_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ginko_ls) |
| Earthly | [`earthlyls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#earthlyls) |
| Elixir | [`elixirls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#elixirls) |
| Elixir | [`lexical`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lexical) |
| Elixir | [`nextls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#nextls) |
| Elm | [`elmls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#elmls) |
| Ember | [`ember`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ember) |
| Emmet | [`emmet_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#emmet_language_server) |
| Emmet | [`emmet_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#emmet_ls) |
| Erg | [`erg_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#erg_language_server) |
| Erlang | [`elp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#elp) |
| Erlang | [`erlangls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#erlangls) |
| F# | [`fsautocomplete`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#fsautocomplete) |
| Facility Service Definition | [`facility_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#facility_language_server) |
| Fennel | [`fennel_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#fennel_language_server) |
| Fennel | [`fennel_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#fennel_ls) |
| Flux | [`flux_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#flux_lsp) |
| Fortran | [`fortls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#fortls) |
| Glimmer | [`glint`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#glint) |
| GLSL | [`glslls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#glslls) |
| Go | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| Go | [`golangci_lint_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#golangci_lint_ls) |
| Go | [`gopls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#gopls) |
| Go | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| Go | [`templ`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#templ) |
| Gradle | [`gradle_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#gradle_ls) |
| GraphQL | [`graphql`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#graphql) |
| Groovy | [`groovyls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#groovyls) |
| Handlebars | [`glint`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#glint) |
| Haskell | [`hls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#hls) |
| Haxe | [`haxe_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#haxe_language_server) |
| Helm | [`helm_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#helm_ls) |
| Hoon | [`hoon_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#hoon_ls) |
| HTML | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| HTML | [`html`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#html) |
| HTML | [`lwc_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lwc_ls) |
| HTML | [`stimulus_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#stimulus_ls) |
| HTML | [`superhtml`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#superhtml) |
| HTML | [`templ`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#templ) |
| HTML | [`twiggy_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#twiggy_language_server) |
| HTMX | [`htmx`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#htmx) |
| Hypr | [`hyprls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#hyprls) |
| Java | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| Java | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| Java | [`java_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#java_language_server) |
| Java | [`jdtls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jdtls) |
| JavaScript | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| JavaScript | [`biome`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#biome) |
| JavaScript | [`denols`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#denols) |
| JavaScript | [`eslint`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#eslint) |
| JavaScript | [`glint`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#glint) |
| JavaScript | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| JavaScript | [`lwc_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lwc_ls) |
| JavaScript | [`quick_lint_js`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#quick_lint_js) |
| JavaScript | [`rome`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#rome) |
| JavaScript | [`ts_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls) |
| JavaScript | [`vtsls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#vtsls) |
| Jinja | [`jinja_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jinja_lsp) |
| Jq | [`jqls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jqls) |
| JSON | [`biome`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#biome) |
| JSON | [`jsonls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jsonls) |
| Jsonnet | [`jsonnet_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jsonnet_ls) |
| JSON | [`rome`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#rome) |
| JSON | [`spectral`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#spectral) |
| JSX | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| Julia ([docs](lua/mason-lspconfig/server_configurations/julials/README.md)) | [`julials`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#julials) |
| KCL | [`kcl`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#kcl) |
| Kotlin | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| Kotlin | [`kotlin_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#kotlin_language_server) |
| Ksh | [`bashls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bashls) |
| LaTeX | [`ltex`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ltex) |
| LaTeX | [`texlab`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#texlab) |
| LaTeX | [`textlsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#textlsp) |
| Lelwel | [`lelwel_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lelwel_ls) |
| LESS | [`css_variables`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#css_variables) |
| LESS | [`cssls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#cssls) |
| Liquid | [`shopify_theme_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#shopify_theme_ls) |
| Liquid | [`theme_check`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#theme_check) |
| Lua | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| Lua | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| Lua | [`lua_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls) |
| Luau | [`luau_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#luau_lsp) |
| Markdown | [`grammarly`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#grammarly) |
| Markdown | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| Markdown | [`ltex`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ltex) |
| Markdown | [`markdown_oxide`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#markdown_oxide) |
| Markdown | [`marksman`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#marksman) |
| Markdown | [`prosemd_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#prosemd_lsp) |
| Markdown | [`remark_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#remark_ls) |
| Markdown | [`vale_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#vale_ls) |
| Markdown | [`zk`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#zk) |
| Matlab | [`matlab_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#matlab_ls) |
| MDX | [`mdx_analyzer`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#mdx_analyzer) |
| Meson | [`mesonlsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#mesonlsp) |
| Meson | [`swift_mesonls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#swift_mesonls) |
| Metamath Zero | [`mm0_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#mm0_ls) |
| Motoko | [`motoko_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#motoko_lsp) |
| Move | [`move_analyzer`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#move_analyzer) |
| Nginx | [`nginx_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#nginx_language_server) |
| Nickel | [`nickel_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#nickel_ls) |
| Nim | [`nim_langserver`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#nim_langserver) |
| Nim | [`nimls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#nimls) |
| Nix | [`nil_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#nil_ls) |
| Nix | [`rnix`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#rnix) |
| Nunjucks | [`jinja_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jinja_lsp) |
| OCaml | [`ocamllsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ocamllsp) |
| Odin | [`ols`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ols) |
| OneScript | [`bsl_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bsl_ls) |
| OpenAPI | [`vacuum`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#vacuum) |
| OpenCL | [`opencl_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#opencl_ls) |
| OpenFOAM | [`foam_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#foam_ls) |
| OpenGL | [`glsl_analyzer`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#glsl_analyzer) |
| OpenSCAD | [`openscad_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#openscad_lsp) |
| Org | [`textlsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#textlsp) |
| Perl | [`perlnavigator`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#perlnavigator) |
| Pest | [`pest_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pest_ls) |
| PHP | [`intelephense`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#intelephense) |
| PHP | [`phpactor`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#phpactor) |
| PHP | [`psalm`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#psalm) |
| PHP | [`stimulus_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#stimulus_ls) |
| PICO-8 | [`pico8_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pico8_ls) |
| PowerShell | [`powershell_es`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#powershell_es) |
| Prisma | [`prismals`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#prismals) |
| Protobuf | [`buf_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#buf_ls) |
| Protobuf | [`pbls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pbls) |
| Puppet | [`puppet`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#puppet) |
| PureScript | [`purescriptls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#purescriptls) |
| Python | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| Python | [`basedpyright`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#basedpyright) |
| Python | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| Python | [`jedi_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jedi_language_server) |
| Python | [`mutt_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#mutt_ls) |
| Python ([docs](lua/mason-lspconfig/server_configurations/pylsp/README.md)) | [`pylsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pylsp) |
| Python | [`pylyzer`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pylyzer) |
| Python | [`pyre`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pyre) |
| Python | [`pyright`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pyright) |
| Python | [`ruff`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ruff) |
| Python | [`sourcery`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#sourcery) |
| Raku | [`raku_navigator`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#raku_navigator) |
| Reason | [`reason_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#reason_ls) |
| Rego | [`regal`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#regal) |
| Rego | [`regols`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#regols) |
| ReScript | [`rescriptls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#rescriptls) |
| reStructuredText | [`ltex`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ltex) |
| Robot Framework | [`robotframework_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#robotframework_ls) |
| R | [`r_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#r_language_server) |
| Ruby | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| Ruby | [`rubocop`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#rubocop) |
| Ruby | [`ruby_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ruby_lsp) |
| Ruby | [`solargraph`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#solargraph) |
| Ruby | [`sorbet`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#sorbet) |
| Ruby | [`standardrb`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#standardrb) |
| Ruby | [`steep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#steep) |
| Ruby | [`stimulus_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#stimulus_ls) |
| Rust | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| Rust | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| Rust | [`rust_analyzer`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#rust_analyzer) |
| Salt | [`salt_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#salt_ls) |
| SCSS | [`css_variables`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#css_variables) |
| SCSS | [`cssls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#cssls) |
| SCSS | [`somesass_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#somesass_ls) |
| Sh | [`bashls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bashls) |
| Slint | [`slint_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#slint_lsp) |
| Smithy | [`smithy_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#smithy_ls) |
| Snakeskin | [`snakeskin_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#snakeskin_ls) |
| Snyk | [`snyk_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#snyk_ls) |
| Solidity | [`solang`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#solang) |
| Solidity | [`solc`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#solc) |
| Solidity | [`solidity`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#solidity) |
| Solidity | [`solidity_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#solidity_ls) |
| Solidity | [`solidity_ls_nomicfoundation`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#solidity_ls_nomicfoundation) |
| Sphinx | [`esbonio`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#esbonio) |
| SQL | [`sqlls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#sqlls) |
| SQL | [`sqls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#sqls) |
| Standard ML | [`millet`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#millet) |
| Starlark | [`bzl`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bzl) |
| Starlark | [`starlark_rust`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#starlark_rust) |
| Starlark | [`starpls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#starpls) |
| Stylelint | [`stylelint_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#stylelint_lsp) |
| SuperHTML | [`superhtml`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#superhtml) |
| Svelte | [`svelte`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#svelte) |
| SystemVerilog | [`hdl_checker`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#hdl_checker) |
| SystemVerilog | [`svlangserver`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#svlangserver) |
| SystemVerilog | [`svls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#svls) |
| SystemVerilog | [`verible`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#verible) |
| Teal | [`teal_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#teal_ls) |
| Terraform | [`terraformls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#terraformls) |
| Terraform | [`tflint`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#tflint) |
| Text | [`grammarly`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#grammarly) |
| Text | [`ltex`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ltex) |
| Text | [`textlsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#textlsp) |
| Text | [`vale_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#vale_ls) |
| Thrift | [`thriftls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#thriftls) |
| TOML | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| TOML | [`taplo`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#taplo) |
| Twig | [`twiggy_language_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#twiggy_language_server) |
| TypeScript | [`ast_grep`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ast_grep) |
| TypeScript | [`biome`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#biome) |
| TypeScript | [`denols`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#denols) |
| TypeScript | [`eslint`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#eslint) |
| TypeScript | [`glint`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#glint) |
| TypeScript | [`harper_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls) |
| TypeScript | [`quick_lint_js`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#quick_lint_js) |
| TypeScript | [`rome`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#rome) |
| TypeScript | [`ts_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls) |
| TypeScript | [`vtsls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#vtsls) |
| Typespec | [`tsp_server`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#tsp_server) |
| Typst | [`tinymist`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#tinymist) |
| Vala | [`vala_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#vala_ls) |
| Verilog | [`hdl_checker`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#hdl_checker) |
| Veryl | [`veryl_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#veryl_ls) |
| VHDL | [`hdl_checker`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#hdl_checker) |
| VHDL | [`vhdl_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#vhdl_ls) |
| VimScript | [`vimls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#vimls) |
| Visualforce | [`visualforce_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#visualforce_ls) |
| Vue | [`volar`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#volar) |
| Vue | [`vuels`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#vuels) |
| V | [`v_analyzer`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#v_analyzer) |
| V | [`vls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#vls) |
| WGSL | [`wgsl_analyzer`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#wgsl_analyzer) |
| XML | [`lemminx`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lemminx) |
| YAML | [`gitlab_ci_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#gitlab_ci_ls) |
| YAML | [`hydra_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#hydra_lsp) |
| YAML | [`spectral`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#spectral) |
| YAML | [`yamlls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#yamlls) |
| Zig | [`zls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#zls) |
| Zsh | [`bashls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bashls) |
| - | [`autotools_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#autotools_ls) |
| - | [`custom_elements_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#custom_elements_ls) |
| - | [`diagnosticls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#diagnosticls) |
| - | [`dprint`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#dprint) |
| - | [`efm`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#efm) |
| - | [`typos_lsp`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#typos_lsp) |
<!-- available-lsp-servers:end -->

[julials]: ./lua/mason-lspconfig/configs/julials/README.md
[omnisharp]: ./lua/mason-lspconfig/configs/omnisharp/README.md
[pylsp]: ./lua/mason-lspconfig/configs/pylsp/README.md
