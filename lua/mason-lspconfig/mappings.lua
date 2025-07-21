local _ = require "mason-core.functional"
local registry = require "mason-registry"

local M = {}

local package_specs_cache = nil

function M.get_mason_map()
    ---@type table<string, string>
    local package_to_lspconfig = {}
    if package_specs_cache == nil then
        package_specs_cache = registry.get_all_package_specs()
    end
    for _, pkg_spec in ipairs(package_specs_cache) do
        local lspconfig = vim.tbl_get(pkg_spec, "neovim", "lspconfig")
        if lspconfig then
            package_to_lspconfig[pkg_spec.name] = lspconfig
        end
    end

    return {
        package_to_lspconfig = package_to_lspconfig,
        lspconfig_to_package = _.invert(package_to_lspconfig),
    }
end

function M.get_filetype_map()
    return require "mason-lspconfig.filetype_mappings"
end

function M.get_all()
    local mason_map = M.get_mason_map()
    return {
        filetypes = M.get_filetype_map(),
        lspconfig_to_package = mason_map.lspconfig_to_package,
        package_to_lspconfig = mason_map.package_to_lspconfig,
    }
end

return M
