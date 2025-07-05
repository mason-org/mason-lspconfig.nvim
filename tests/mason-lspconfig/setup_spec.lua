local match = require "luassert.match"
local spy = require "luassert.spy"
local stub = require "luassert.stub"

local Pkg = require "mason-core.package"
local a = require "mason-core.async"
local mason_lspconfig = require "mason-lspconfig"
local platform = require "mason-core.platform"
local registry = require "mason-registry"

describe("mason-lspconfig setup", function()
    before_each(function()
        a.run_blocking(a.wait, vim.schedule)
    end)

    it("should set up user commands", function()
        mason_lspconfig.setup()
        local user_commands = vim.api.nvim_get_commands {}

        assert.is_true(match.tbl_containing {
            bang = false,
            bar = false,
            nargs = "*",
            complete = "custom",
            definition = "Install one or more LSP servers.",
        }(user_commands["LspInstall"]))

        assert.is_true(match.tbl_containing {
            bang = false,
            bar = false,
            definition = "Uninstall one or more LSP servers.",
            nargs = "+",
            complete = "custom",
        }(user_commands["LspUninstall"]))
    end)

    it(
        "should set up package aliases",
        async_test(function()
            spy.on(registry, "register_package_aliases")

            mason_lspconfig.setup {}
            a.wait(vim.schedule)

            assert.spy(registry.register_package_aliases).was_called(1)
            assert.spy(registry.register_package_aliases).was_called_with {
                ["dummy"] = { "dummylsp" },
                ["dummy2"] = { "dummy2lsp" },
                ["fail_dummy"] = { "fail_dummylsp" },
            }
        end)
    )
end)

describe("mason-lspconfig.setup() :: feature :: ensure_installed", function()
    before_each(function()
        a.run_blocking(a.wait, vim.schedule)
        local settings = require "mason-lspconfig.settings"
        settings.set(settings._DEFAULT_SETTINGS)

        for _, pkg in ipairs(registry.get_all_packages()) do
            if pkg:is_installed() then
                pkg:uninstall()
            end
        end
    end)

    it(
        "should install servers listed in ensure_installed",
        async_test(function()
            local dummy = registry.get_package "dummy"
            local fail_dummy = registry.get_package "fail_dummy"
            spy.on(Pkg, "install")

            platform.is_headless = false
            mason_lspconfig.setup { ensure_installed = { "dummylsp@1.0.0", "fail_dummylsp" } }
            a.wait(vim.schedule)

            assert.spy(Pkg.install).was_called(2)
            assert.spy(Pkg.install).was_called_with(match.ref(dummy), { version = "1.0.0" }, match.is_function())
            assert.spy(Pkg.install).was_called_with(match.ref(fail_dummy), { version = nil }, match.is_function())
            assert.wait_for(function()
                assert.is_true(dummy.install_handle:is_closed())
                assert.is_true(fail_dummy.install_handle:is_closed())
            end)
        end)
    )

    it(
        "should not install servers listed in ensure_installed when headless",
        async_test(function()
            spy.on(Pkg, "install")

            platform.is_headless = true
            mason_lspconfig.setup { ensure_installed = { "dummylsp@1.0.0", "fail_dummylsp" } }

            a.wait(vim.schedule)
            assert.spy(Pkg.install).was_called(0)
        end)
    )

    it(
        "should notify when installing servers listed in ensure_installed",
        async_test(function()
            spy.on(vim, "notify")

            platform.is_headless = false
            mason_lspconfig.setup { ensure_installed = { "dummylsp", "fail_dummylsp" } }

            a.wait(vim.schedule)

            assert.spy(vim.notify).was_called(2)
            assert
                .spy(vim.notify)
                .was_called_with(
                    [[[mason-lspconfig.nvim] installing dummylsp]],
                    vim.log.levels.INFO,
                    { title = "mason-lspconfig.nvim" }
                )
            assert.spy(vim.notify).was_called_with(
                [[[mason-lspconfig.nvim] installing fail_dummylsp]],
                vim.log.levels.INFO,
                { title = "mason-lspconfig.nvim" }
            )

            assert.wait_for(function()
                assert.spy(vim.notify).was_called_with(
                    [[[mason-lspconfig.nvim] dummylsp was successfully installed]],
                    vim.log.levels.INFO,
                    { title = "mason-lspconfig.nvim" }
                )
                assert.spy(vim.notify).was_called_with(
                    [[[mason-lspconfig.nvim] failed to install fail_dummylsp. Installation logs are available in :Mason and :MasonLog]],
                    vim.log.levels.ERROR,
                    { title = "mason-lspconfig.nvim" }
                )
            end)
        end)
    )
end)

describe("mason-lspconfig.setup() :: feature :: automatic_enable", function()
    before_each(function()
        a.run_blocking(a.wait, vim.schedule)
        local settings = require "mason-lspconfig.settings"
        settings.set(settings._DEFAULT_SETTINGS)

        spy.on(vim.lsp, "enable")
        stub(registry, "get_installed_package_names").returns {
            "dummy",
            "dummy2",
        }
    end)

    it(
        "should enable all installed servers",
        async_test(function()
            mason_lspconfig.setup {
                automatic_enable = true,
            }

            a.wait(vim.schedule)

            assert.spy(vim.lsp.enable).was_called(2)
            assert.spy(vim.lsp.enable).was_called_with "dummylsp"
            assert.spy(vim.lsp.enable).was_called_with "dummy2lsp"
        end)
    )

    it(
        "should exclude servers",
        async_test(function()
            mason_lspconfig.setup {
                automatic_enable = {
                    exclude = { "dummy2lsp" },
                },
            }

            a.wait(vim.schedule)

            assert.spy(vim.lsp.enable).was_called(1)
            assert.spy(vim.lsp.enable).was_called_with "dummylsp"
        end)
    )

    it(
        "should only enable specified servers",
        async_test(function()
            mason_lspconfig.setup {
                automatic_enable = {
                    "dummy2lsp",
                },
            }

            a.wait(vim.schedule)

            assert.spy(vim.lsp.enable).was_called(1)
            assert.spy(vim.lsp.enable).was_called_with "dummy2lsp"
        end)
    )
end)

describe("mason-lspconfig.setup_handlers() :: backward compatibility", function()
    before_each(function()
        local settings = require "mason-lspconfig.settings"
        settings.set(settings._DEFAULT_SETTINGS)
        
        spy.on(vim, "notify")
        stub(registry, "get_installed_package_names").returns {
            "dummy",
            "dummy2",
        }
    end)
    
    it("should show deprecation warning when setup_handlers is called", function()
        local mock_handler = spy.new(function() end)
        
        mason_lspconfig.setup_handlers({
            mock_handler,
            ["dummylsp"] = mock_handler,
        })
        
        -- Should show deprecation warning
        assert.spy(vim.notify).was_called_with(
            match.has_match("setup_handlers.*deprecated"),
            vim.log.levels.WARN,
            match._
        )
        
        -- Should still call handlers for installed servers
        assert.spy(mock_handler).was_called(2)
        assert.spy(mock_handler).was_called_with("dummylsp")
        assert.spy(mock_handler).was_called_with("dummy2lsp")
    end)
    
    it("should disable automatic_enable when setup_handlers is used", function()
        local settings = require "mason-lspconfig.settings"
        assert.is_true(settings.current.automatic_enable)
        
        mason_lspconfig.setup_handlers({ function() end })
        
        assert.is_false(settings.current.automatic_enable)
        assert.spy(vim.notify).was_called_with(
            match.has_match("Disabling automatic_enable"),
            vim.log.levels.INFO,
            match._
        )
    end)
end)
