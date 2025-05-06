return {
    name = "dummy",
    description = [[This is a dummy package.]],
    licenses = {},
    categories = { "LSP" },
    languages = { "DummyLang" },
    homepage = "https://example.com",
    source = {
        id = "pkg:mason/dummy@1.0.0",
        install = function() end,
    },
    neovim = {
        lspconfig = "dummylsp",
    },
}
