-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Czyści podświetlenie szukania po naciśnięciu Esc w trybie Normal
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.opt.ignorecase = true -- ignoruje wielkość liter przy szukaniu...
vim.opt.smartcase = true -- ...chyba że użyjesz choć jednej wielkiej litery
vim.opt.incsearch = true -- skacze do wyników już w trakcie wpisywania słowa
