return {
    before_init = function(_, config)
        -- This replaces nvim-lspconfig's before_init by also looking for typescript that is bundled with the package
        -- via Mason
        local typescript = require "mason-lspconfig.typescript"
        local install_dir = vim.fn.expand "$MASON/packages/vue-language-server"

        config.init_options.typescript.serverPath = typescript.resolve_tsserver(install_dir, config.root_dir)
        config.init_options.typescript.tsdk = typescript.resolve_tsdk(install_dir, config.root_dir)
    end,
}
