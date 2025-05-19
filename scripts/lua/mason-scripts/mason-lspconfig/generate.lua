local Optional = require "mason-core.optional"

local _ = require "mason-core.functional"
local a = require "mason-core.async"
local path = require "mason-core.path"
local script_utils = require "mason-scripts.utils"

local MASON_LSPCONFIG_DIR = path.concat { "lua", "mason-lspconfig" }

require("mason").setup()
local registry = require "mason-registry"
registry.refresh()

---@async
local function create_lspconfig_filetype_map()
    local lspconfig_servers =
        _.filter_map(_.compose(Optional.of_nilable, _.path { "neovim", "lspconfig" }), registry.get_all_package_specs())
    ---@type table<string, string[]>
    local filetype_map = {}

    for _, server_name in ipairs(lspconfig_servers) do
        local filetypes = vim.tbl_get(vim.lsp.config, server_name, "filetypes")
        if filetypes then
            for _, filetype in ipairs(filetypes) do
                if not filetype_map[filetype] then
                    filetype_map[filetype] = {}
                end
                table.insert(filetype_map[filetype], server_name)
                table.sort(filetype_map[filetype])
            end
        end
    end

    script_utils.write_file(
        path.concat { MASON_LSPCONFIG_DIR, "filetype_mappings.lua" },
        "return " .. vim.inspect(filetype_map),
        "w"
    )
end

a.run_blocking(function()
    create_lspconfig_filetype_map()
end)
