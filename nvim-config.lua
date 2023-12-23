--
-- REMAP
--

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("i", "<C-c>", "<Esc>")

--
-- OPTIONS
--

vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" }  -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = false                        -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 300                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = false                       -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab
vim.opt.cursorline = false                      -- highlight the current line
vim.opt.number = false                          -- set numbered lines
vim.opt.relativenumber = false                  -- set relative numbered lines
vim.opt.signcolumn = "no"                       -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.linebreak = true                        -- companion to wrap, don't split words
vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.guifont = "Comic Mono:h17"              -- the font used in graphical neovim applications
vim.opt.whichwrap = "bs<>[]hl"                  -- which "horizontal" keys are allowed to travel to prev/next line
vim.opt.laststatus = 0
vim.opt.autoindent = true
vim.opt.autowrite = true
vim.opt.hlsearch = false
vim.cmd("hi NonText guifg=Black guibg=Black")

--
-- PLUGINS
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
        change_detection = {
                notify = false
        }
}

require("lazy").setup({

        {
                'windwp/nvim-autopairs',
                event = "InsertEnter",
                opts = {} -- this is equalent to setup({}) function
        },
        {
                "folke/which-key.nvim",
                event = "VeryLazy",
                init = function()
                        vim.o.timeout = true
                        vim.o.timeoutlen = 100
                end,
                opts = {}
        }

}, opts)
