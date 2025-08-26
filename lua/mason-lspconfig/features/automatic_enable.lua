local _ = require "mason-core.functional"
local mappings = require "mason-lspconfig.mappings"
local registry = require "mason-registry"
local settings = require "mason-lspconfig.settings"

local enabled_servers = {}

---@param mason_pkg string | Package
local function enable_server(mason_pkg)
    if type(mason_pkg) ~= "string" then
        mason_pkg = mason_pkg.name
    end
    local lspconfig_name = mappings.get_mason_map().package_to_lspconfig[mason_pkg]
    if not lspconfig_name then
        return
    end
    if enabled_servers[lspconfig_name] then
        return
    end

    local automatic_enable = settings.current.automatic_enable

    if type(automatic_enable) == "table" then
        local exclude = automatic_enable.exclude
        if exclude then
            if _.any(_.equals(lspconfig_name), exclude) then
                -- This server is explicitly excluded.
                return
            end
        else
            if not _.any(_.equals(lspconfig_name), automatic_enable) then
                -- This server is not explicitly enabled.
                return
            end
        end
    elseif automatic_enable == false then
        return
    end

    -- We don't provide LSP configurations in the lsp/ directory because it risks overriding configurations in a way the
    -- user doesn't want. Instead we only override LSP configurations for servers that are installed via Mason.
    local ok, config = pcall(require, ("mason-lspconfig.lsp.%s"):format(lspconfig_name))
    if ok then
        vim.lsp.config(lspconfig_name, config)
    end

    vim.schedule(function()
        vim.lsp.enable(lspconfig_name)
    end)

    enabled_servers[lspconfig_name] = true
end

local enable_server_scheduled = vim.schedule_wrap(enable_server)

return {
    init = function()
        enabled_servers = {}
        _.each(enable_server, registry.get_installed_package_names())
        -- We deregister the event handler primarily for testing purposes where .setup() is called multiple times in the
        -- same instance.
        registry:off("package:install:success", enable_server_scheduled)
        registry:on("package:install:success", enable_server_scheduled)
    end,
    enable_all = function()
        _.each(enable_server, registry.get_installed_package_names())
    end,
}
