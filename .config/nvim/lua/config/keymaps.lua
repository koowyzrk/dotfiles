-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "<leader>cE", function()
--   setCod()
-- end, { desc = "enable codeium" })
-- vim.keymap.set("n", "<leader>cD", function()
--   unsetCod()
-- end, { desc = "disable codeium" })
--
-- function setCod()
--   -- ftplugin/haskell.lua
--   local cmp = require("cmp")
--   local sources = cmp.get_config().sources
--   local codeium_enabled = false
--   for index = #sources, 1, -1 do
--     if sources[index].name == "codeium" then
--       codeium_enabled = true
--     end
--   end
--   if not codeium_enabled then
--     table.insert(sources, 1, {
--       name = "codeium",
--       group_index = 1,
--       priority = 100,
--     })
--     cmp.setup.buffer({ sources = sources })
--   end
-- end
--
-- function unsetCod()
--   -- ftplugin/haskell.lua
--   local cmp = require("cmp")
--   local sources = cmp.get_config().sources
--   for index = #sources, 1, -1 do
--     if sources[index].name == "codeium" then
--       table.remove(sources, index)
--     end
--   end
--   cmp.setup.buffer({ sources = sources })
-- end

vim.keymap.set("n", "<leader>mf", function()
  local input = vim.fn.input("Markdown path to create: ")
  require("custom.markdown_utils").create_markdown_file(input)
end, { desc = "Create Markdown file recursively" })

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Bold: ***text***
map("v", "<leader>mb", 'c**<C-r>"**<Esc>', opts)
-- Italic: *text*
map("v", "<leader>mi", 'c*<C-r>"*<Esc>', opts)
-- BoldItalic: ***text***
map("v", "<leader>mB", 'c***<C-r>"***<Esc>', opts)

-- diffView
vim.keymap.set("n", ",hh", "<cmd>DiffviewFileHistory<cr>", { desc = "Repo history" })
--
