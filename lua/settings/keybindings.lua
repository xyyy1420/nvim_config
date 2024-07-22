require("helpers/global-helpers")
require("helpers/keyboard-helpers")

g.mapleader = "\\"

--- lsp {{{
nm("K", "<cmd>lua vim.lsp.buf.hover()<CR>")        -- Hover object
nm("ga", "<cmd>lua vim.lsp.buf.code_action()<CR>") -- Code actions
nm("gR", "<cmd>lua vim.lsp.buf.rename()<CR>")      -- Rename an object
nm("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>") -- Go to declaration
--- }}}

--- fzf-lua {{{
nm("gd", "<cmd>lua require('fzf-lua').lsp_definitions({jump_to_single_result=true})<CR>") -- Goto declaration
nm("<leader>p", "<cmd>FzfLua oldfiles<CR>")                                               -- Show recent files
nm("<leader>O", "<cmd>FzfLua git_files<CR>")                                              -- Search for a file in project
nm("<leader>o", "<cmd>FzfLua files<CR>")                                                  -- Search for a file (ignoring git-ignore)
nm("<leader>i", "<cmd>FzfLua jumps<CR>")                                                  -- Show jumplist (previous locations)
nm("<leader>b", "<cmd>FzfLua git_branches<CR>")                                           -- Show git branches
nm("<leader>f", "<cmd>FzfLua live_grep<CR>")                                              -- Find a string in project
nm("<leader>q", "<cmd>FzfLua buffers<CR>")                                                -- Show all buffers
nm("<leader>a", "<cmd>FzfLua<CR>")                                                        -- Show all commands
--- }}}

-- insert mode set Emacs {{{
im("<C-a>", "<home>")
im("<C-e>", "<end>")
im("<C-d>", "<del>")
im("<C-_>", "<C-k>")
--- }}}


-- leader tabe{{{
nm("<leader>1", "<esc>1gt<cr>")
nm("<leader>2", "<esc>2gt<cr>")
nm("<leader>3", "<esc>3gt<cr>")
nm("<leader>4", "<esc>4gt<cr>")
nm("<leader>5", "<esc>5gt<cr>")
nm("<leader>6", "<esc>6gt<cr>")
nm("<leader>7", "<esc>7gt<cr>")
nm("<leader>8", "<esc>8gt<cr>")
nm("<leader>9", "<esc>9gt<cr>")
nm("<leader>0", "<esc>10gt<cr>")
--}}}
