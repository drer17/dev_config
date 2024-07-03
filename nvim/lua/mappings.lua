require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader><F9>", "<cmd> DapToggleBreakpoint <CR>")
map("n", "<leader><F5>", function()
  require "dap-python"
  vim.cmd "DapNew"
end)
map("n", "<leader><F10>", "<cmd> DapStepOver <CR>")
map("n", "<leader><F11>", "<cmd> DapStepInto <CR>")
map("n", "<leader>dc", "<cmd> DapContinue <CR>")
map("n", "<leader>dr", "<cmd> DapRestart <CR>")
map("n", "<leader>dq", "<cmd> DapTerminate <CR>")
map("n", "<leader>df", function()
  require("dapui").open { reset = true }
end)


map("n", "<leader>g", function()
  require "lazygit"
  vim.cmd "LazyGit"
end)

map("n", "<leader>rn", "<cmd> IncRename <CR>")

map("x", "<leader>re", function()
  require("refactoring").refactor "Extract Function"
end)
map("x", "<leader>rf", function()
  require("refactoring").refactor "Extract Function To File"
end)
-- Extract function supports only visual mode
map("x", "<leader>rv", function()
  require("refactoring").refactor "Extract Variable"
end)
-- Extract variable supports only visual mode
map("n", "<leader>rI", function()
  require("refactoring").refactor "Inline Function"
end)
-- Inline func supports only normal
map({ "n", "x" }, "<leader>ri", function()
  require("refactoring").refactor "Inline Variable"
end)
-- Inline var supports both normal and visual mode

map("n", "<leader>rb", function()
  require("refactoring").refactor "Extract Block"
end)
map("n", "<leader>rbf", function()
  require("refactoring").refactor "Extract Block To File"
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
