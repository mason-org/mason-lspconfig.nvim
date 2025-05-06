return {
    name = "fail_dummy",
    description = [[This is a dummy package that fails.]],
    licenses = {},
    categories = { "LSP" },
    languages = { "DummyLang" },
    homepage = "https://example.com",
    source = {
        id = "pkg:mason/fail_dummy@1.0.0",
        install = function()
            error("fail-dummy doesn't want to be installed", 0)
        end,
    },
    neovim = {
        lspconfig = "fail_dummylsp",
    },
}
