local stub = require "luassert.stub"

local _ = require "mason-core.functional"
local mappings = require "mason-lspconfig.mappings"
local mason_lspconfig = require "mason-lspconfig"

describe("mason-lspconfig API", function()
    local dummy_config = vim.lsp.config.dummylsp
    local dummy2_config = vim.lsp.config.dummy2lsp

    after_each(function()
        vim.lsp.config("dummylsp", dummy_config)
        vim.lsp.config("dummy2lsp", dummy2_config)
    end)

    it("should return all available servers", function()
        local available_servers = mason_lspconfig.get_available_servers()
        assert.equals(vim.tbl_count(require "dummy-registry.index"), #available_servers)
    end)

    it("should return all available servers for given filetype", function()
        stub(mappings, "get_filetype_map", {
            ["dummylang"] = { "dummylsp" },
        })

        assert.same(
            { "dummylsp" },
            _.sort_by(
                _.identity,
                mason_lspconfig.get_available_servers {
                    filetype = "dummylang",
                }
            )
        )
    end)

    it("should return all available servers for given filetypes", function()
        stub(mappings, "get_filetype_map", {
            ["dummylang"] = { "dummylsp" },
            ["madeuplang"] = { "dummy2lsp" },
        })
        assert.same(
            { "dummy2lsp", "dummylsp" },
            _.sort_by(
                _.identity,
                mason_lspconfig.get_available_servers {
                    filetype = { "dummylang", "madeuplang" },
                }
            )
        )
    end)

    it("should return no servers if filetype predicate has no matches", function()
        assert.same(
            {},
            mason_lspconfig.get_available_servers {
                filetype = { "thisfiletypesimplydoesntexist" },
            }
        )
    end)
end)
