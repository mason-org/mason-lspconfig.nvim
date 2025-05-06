return {
    name = "dummy2",
    description = [[This is a dummy2 package.]],
    licenses = {},
    categories = { "LSP" },
    languages = { "Dummy2Lang" },
    homepage = "https://example.com",
    source = {
        id = "pkg:mason/dummy2@1.0.0",
        install = function() end,
    },
    neovim = {
        lspconfig = "dummy2lsp",
    },
}
