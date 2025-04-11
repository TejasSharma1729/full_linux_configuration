-- ~/.config/nvim/init.lua
-- Basic settings (translated from your init.vim)
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

-- Filetype-specific autocmds (translated from Vimscript)
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
        vim.opt_local.noexpandtab = true
    end
})

-- Lazy.nvim bootstrap
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

-- Plugin configuration
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
    -- Converted Vundle plugins
    { "scrooloose/nerdtree", config = function()
        vim.g.NERDTreeShowHidden = 1
    end },
    -- { "bfrg/vim-cpp-modern" },
    -- { "mxw/vim-jsx" },
    -- { "pangloss/vim-javascript" },
    { "sheerun/vim-polyglot" },
    { "rafi/awesome-vim-colorschemes" },
    { "itchyny/lightline.vim" },
    { "jiangmiao/auto-pairs", config = function()
        vim.g.AutoPairsMapCR = false    -- Disable automatic <CR> mapping
        vim.g.AutoPairsShortcutToggle = '<M-p>'    -- Change default toggle key
    end },
    { "davidhalter/jedi-vim" },
    { "github/copilot.vim" },
    { "lervag/vimtex" },
    { "xuhdev/vim-latex-live-preview", config = function()
        vim.g.livepreview_previewer = 'open -a Preview'
    end },
    { "ptzz/lf.vim" },
    { "voldikss/vim-floaterm" },
}, {
    install = { colorscheme = { "gruvbox" } }
})

-- Final post-configuration
vim.cmd.colorscheme("gruvbox")
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

