local trouble = require("trouble")

require('telescope').setup{
  defaults = {
  mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    }
  },
  no_ignore = true,
  no_ignore_parent = true,
  pickers = {
  },
  extensions = {
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pF', '<CMD>Telescope find_files search_dirs=~/Study<CR>', {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pS', '<CMD>Telescope live_grep search_dirs=~/Study<CR>', {})

-- change keys
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[F]ind [H]elp' })

vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })

vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[F]ind current [W]ord' })

vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

-- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[ ] Find existing buffers' })


-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>pw', function()
-- You can pass additional configuration to Telescope to change the theme, layout, etc.
builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  winblend = 10,
  previewer = true,
})
end, { desc = '[/] Fuzzily search in current buffer' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
