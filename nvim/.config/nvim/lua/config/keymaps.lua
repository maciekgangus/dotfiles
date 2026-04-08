-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Lazydocker
vim.keymap.set("n", "<leader>td", function()
  Snacks.terminal("lazydocker")
end, { desc = "Otwórz Lazydocker" })

-- Lazygit (LazyVim ma go domyślnie pod <leader>gg, ale dodajemy alias dla porządku)
vim.keymap.set("n", "<leader>tg", function()
  Snacks.lazygit()
end, { desc = "Otwórz Lazygit" })

-- Yazi (Menedżer plików)
vim.keymap.set("n", "<leader>ty", function()
  Snacks.terminal("yazi")
end, { desc = "Otwórz Yazi" })

-- Btop (Monitor systemu)
vim.keymap.set("n", "<leader>tb", function()
  Snacks.terminal("btop")
end, { desc = "Otwórz Btop" })

-- Gh-dash (GitHub)
vim.keymap.set("n", "<leader>th", function()
  Snacks.terminal("gh dash")
end, { desc = "Otwórz GitHub Dash" })
