local M = {}

function M.check()
    vim.health.start "mason-lspconfig.nvim"

    if vim.fn.has "nvim-0.11" ~= 1 then
        vim.health.error "Neovim v0.11 or higher is required."
    else
        vim.health.ok "Neovim v0.11"
    end

    local ok, mason_version = pcall(require, "mason.version")
    if ok and mason_version.MAJOR_VERSION == 2 then
        vim.health.ok "mason.nvim v2"
    else
        vim.health.error "mason.nvim v2 is required."
    end
end

return M
