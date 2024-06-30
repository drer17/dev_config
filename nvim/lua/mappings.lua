require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader><F9>", "<cmd> DapToggleBreakpoint <CR>")
map("n", "<leader><F5>", function()
  require("dap-python").test_method()
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
