vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- exit insert mode with jk
keymap("i", "jk", "<ESC>", opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Move text up and down
-- Normal
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
-- Visual
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
-- Visual Block
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Fix Paste
keymap("v", "p", '"_dP', opts)

-- Save file
keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save window" })
keymap("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Close Buffer" })
keymap("n", "<leader>q", ":q!<CR>", { noremap = true, silent = true, desc = "Close Buffer Force" })

-- Neotree
keymap("n", "<leader>e", ":Neotree focus<CR>", { noremap = true, silent = true, desc = "Neotree focus" })
keymap("n", "<leader>to", ":Neotree toggle<CR>", { noremap = true, silent = true, desc = "Neotree Toggle" })

-- Comments
keymap("n", "<leader>/", "gcc", { remap = true, silent = true, desc = "Toggle Comment" })
keymap("v", "<leader>/", "gcc", { remap = true, silent = true, desc = "Toggle Comment" })

-- Indenting
keymap("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent Left" })
keymap("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent Right" })

-- Pane and Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("t", "<C-h>", "wincmd h", opts)
keymap("t", "<C-j>", "wincmd j", opts)
keymap("t", "<C-k>", "wincmd k", opts)
keymap("t", "<C-l>", "wincmd l", opts)

keymap("t", "<Leader><ESC>", "<C-\\><C-n>", opts)

-- keymap("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
-- keymap("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
-- keymap("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
-- keymap("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

--Window Split Management
keymap("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Split Vertical" }) -- Split Vertically
keymap("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true, desc = "Split Horizontal" }) -- Split Horizontally

-- -- -- Show Full File-Path
keymap("n", "<leader>pa", ":echo expand('%:p')<CR>", { noremap = true, silent = true, desc = "Show Full File Path" }) -- Split Vertically

-- Source luasnip
keymap("n", "<leader><leader>w", ":source ~/.config/nvim/lua/luasnippets/snippets.lua<CR>", opts)

-- Launch LSP info
keymap("n", "<leader><leader>l", ":LspInfo<CR>", opts)
keymap("n", "<leader><leader>ll", ":LspLog<CR>", opts)
