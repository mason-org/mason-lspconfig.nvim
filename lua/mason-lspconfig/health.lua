local M = {}

function M.check()
    vim.health.start "mason-lspconfig.nvim"

    if vim.fn.has "nvim-0.11" ~= 1 then
        vim.health.error "Neovim v0.11 or higher is required."
    else
        vim.health.ok "Neovim v0.11"
    end
end

return M
