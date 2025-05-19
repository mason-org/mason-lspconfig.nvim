local match = require "luassert.match"
local spy = require "luassert.spy"
local stub = require "luassert.stub"

local Pkg = require "mason-core.package"
local api = require "mason-lspconfig.api.command"
local mappings = require "mason-lspconfig.mappings"
local registry = require "mason-registry"

describe(":LspInstall", function()
    it("should install the provided servers", function()
        local dummy = registry.get_package "dummy"
        spy.on(Pkg, "install")
        api.LspInstall { "dummylsp@1.0.0" }
        assert.spy(Pkg.install).was_called(1)
        assert.spy(Pkg.install).was_called_with(match.ref(dummy), {
            version = "1.0.0",
        }, match.is_function())
    end)

    it(
        "should prompt user for server to install based on filetype",
        async_test(function()
            local dummy = registry.get_package "dummy"
            spy.on(Pkg, "install")
            stub(vim.ui, "select")
            stub(mappings, "get_filetype_map", {
                ["dummylang"] = { "dummylsp" },
            })
            vim.ui.select.invokes(function(items, opts, callback)
                callback "dummylsp"
            end)
            vim.cmd [[new | setf dummylang]]
            api.LspInstall {}
            assert.spy(Pkg.install).was_called(1)
            assert.spy(Pkg.install).was_called_with(match.ref(dummy), {
                version = nil,
            }, match.is_function())
            assert.spy(vim.ui.select).was_called(1)
            assert.spy(vim.ui.select).was_called_with({ "dummylsp" }, match.is_table(), match.is_function())
        end)
    )

    it(
        "should not prompt user for server to install if no filetype match exists",
        async_test(function()
            spy.on(Pkg, "install")
            stub(vim.ui, "select")
            vim.cmd [[new | setf nolsplang]]
            api.LspInstall {}
            assert.spy(Pkg.install).was_called(0)
            assert.spy(vim.ui.select).was_called(0)
        end)
    )
end)

describe(":LspUninstall", function()
    it("should uninstall the provided servers", function()
        local dummy = registry.get_package "dummy"
        spy.on(Pkg, "uninstall")
        api.LspUninstall { "dummylsp" }
        assert.spy(Pkg.uninstall).was_called(1)
        assert.spy(Pkg.uninstall).was_called_with(match.ref(dummy))
    end)
end)
