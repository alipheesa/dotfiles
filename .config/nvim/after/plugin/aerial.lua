require("aerial").setup({
  on_attach = function(bufnr)
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
  layout = {
      default_direction = "prefer_left",
  },
  hightlight_on_hover = true,
})

vim.keymap.set("n", "<leader>ll", "<cmd>AerialToggle<CR>")
vim.keymap.set("n", "<leader>LL", "<cmd>AerialToggle!<CR>")

