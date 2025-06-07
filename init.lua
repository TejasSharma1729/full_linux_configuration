vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 100
vim.opt.hlsearch = true
vim.opt.backspace = "indent,eol,start"
vim.opt.laststatus = 2
vim.opt.mouse = "anv"

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "java" },
    callback = function()
        vim.opt_local.foldmethod = "syntax"
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "make", "python" },
    callback = function()
        vim.opt_local.foldmethod = "indent"
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        vim.opt_local.expandtab = false
    end
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "folke/snacks.nvim",
        priority = 1000,
        opts = {
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            explorer = { enabled = true },
            indent = { enabled = true },
            scroll = { enabled = true },
        }
    },
    { "sheerun/vim-polyglot" },
    { "tomasiser/vim-code-dark" },
    { "itchyny/lightline.vim" },
    { "jiangmiao/auto-pairs", config = function()
       vim.g.AutoPairsMapCR = 1    -- Disable automatic <CR> mapping
       vim.g.AutoPairsCenterLine = 0  -- Disable centering
        vim.g.AutoPairsShortcutToggle = '<M-p>'    -- Change default toggle key
    end },
    { "davidhalter/jedi-vim" },
    { "github/copilot.vim" },
    { "lervag/vimtex" },
    { "ptzz/lf.vim" },
    { "voldikss/vim-floaterm" },
}, {
    install = { colorscheme = { "codedark" } }
})

vim.cmd.colorscheme("codedark")
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
