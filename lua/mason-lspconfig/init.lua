local _ = require "mason-core.functional"
local platform = require "mason-core.platform"
local settings = require "mason-lspconfig.settings"

local M = {}

local function check_and_notify_bad_setup_order()
    local mason_ok, mason = pcall(require, "mason")
    local is_bad_order = not mason_ok or mason.has_setup == false
    local impacts_functionality = not mason_ok
        or #settings.current.ensure_installed > 0
        or settings.current.automatic_enable ~= false
    if is_bad_order and impacts_functionality then
        require "mason-lspconfig.notify"(
            "mason.nvim has not been set up. Make sure to set up mason.nvim before mason-lspconfig.nvim. See :h mason-lspconfig-quickstart",
            vim.log.levels.WARN
        )
    end
end

---@param config MasonLspconfigSettings | nil
function M.setup(config)
    if config then
        settings.set(config)
    end

    check_and_notify_bad_setup_order()

    local registry = require "mason-registry"
    registry.refresh(vim.schedule_wrap(function(success, updated_registries)
        if not platform.is_headless and #settings.current.ensure_installed > 0 then
            require "mason-lspconfig.features.ensure_installed"()
        end
        if success and #updated_registries > 0 and settings.current.automatic_enable ~= false then
            require("mason-lspconfig.features.automatic_enable").enable_all()
        end
        registry.register_package_aliases(_.map(function(server_name)
            return { server_name }
        end, require("mason-lspconfig.mappings").get_mason_map().package_to_lspconfig))
    end))

    if settings.current.automatic_enable ~= false then
        require("mason-lspconfig.features.automatic_enable").init()
    end

    require "mason-lspconfig.api.command"
end

---@return string[]
function M.get_installed_servers()
    local Optional = require "mason-core.optional"
    local registry = require "mason-registry"
    local server_mapping = require("mason-lspconfig.mappings").get_mason_map()

    return _.filter_map(function(pkg_name)
        return Optional.of_nilable(server_mapping.package_to_lspconfig[pkg_name])
    end, registry.get_installed_package_names())
end

---@param filetype string | string[]
local function is_server_in_filetype(filetype)
    local filetype_mapping = require("mason-lspconfig.mappings").get_filetype_map()

    local function get_servers_by_filetype(ft)
        return filetype_mapping[ft] or {}
    end

    local server_candidates = _.compose(
        _.set_of,
        _.cond {
            { _.is "string", get_servers_by_filetype },
            { _.is "table", _.compose(_.flatten, _.map(get_servers_by_filetype)) },
            { _.T, _.always {} },
        }
    )(filetype)

    ---@param server_name string
    ---@return boolean
    return function(server_name)
        return server_candidates[server_name]
    end
end

---Get a list of available servers in mason-registry
---@param filter { filetype: string | string[] }?: (optional) Used to filter the list of server names.
--- The available keys are
---   - filetype (string | string[]): Only return servers with matching filetype
---@return string[]
function M.get_available_servers(filter)
    local registry = require "mason-registry"
    local server_mapping = require("mason-lspconfig.mappings").get_mason_map()
    local Optional = require "mason-core.optional"
    filter = filter or {}
    local predicates = {}

    if filter.filetype then
        table.insert(predicates, is_server_in_filetype(filter.filetype))
    end

    return _.filter_map(function(pkg_name)
        return Optional.of_nilable(server_mapping.package_to_lspconfig[pkg_name]):map(function(server_name)
            if #predicates == 0 or _.all_pass(predicates, server_name) then
                return server_name
            end
        end)
    end, registry.get_all_package_names())
end

---Returns the "lspconfig <-> mason" mapping tables.
---@return { lspconfig_to_package: table<string, string>, package_to_lspconfig: table<string, string> }
function M.get_mappings()
    local mappings = require "mason-lspconfig.mappings"
    return mappings.get_all()
end

return M
