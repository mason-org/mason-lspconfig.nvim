local M = {}

---@class MasonLspconfigSettings
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

---@class MasonLspconfigUserSettings
---@field ensure_installed? string[]
---@field automatic_installation? boolean
---@field handlers? table<string, fun(server_name: string)>

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = M._DEFAULT_SETTINGS

---@param opts MasonLspconfigSettings | MasonLspconfigUserSettings
function M.set(opts)
    M.current = vim.tbl_deep_extend("force", M.current, opts)
end

return M
