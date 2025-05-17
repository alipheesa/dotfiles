-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = false,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = none
    -- {               -- map the value of 'background' option to a theme
    --     dark = "dragon",           -- try "dragon" !
    --     light = "lotus"
    -- },
})

--  wave the default heart-warming theme,
--  dragon for those late-night sessions
--  lotus for when you're out in the open.


vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {}),
    pattern = 'gruvbox-material',
    callback = function()
        local config = vim.fn['gruvbox_material#get_configuration']()
        vim.g.gruvbox_material_enable_italic = 0
        vim.g.enable_italic = 0
        vim.api.nvim_set_hl(0, 'VirtualTextWarning', { link = 'WarningMsg' })
        vim.api.nvim_set_hl(0, 'VirtualTextError', { link = 'ErrorMsg' })
        vim.api.nvim_set_hl(0, 'VirtualTextInfo', { link = 'InfoMsg' })
        vim.api.nvim_set_hl(0, 'VirtualTextHint', { link = 'HintMsg' })
    end
})

function ColorMyPencils(color)
	color = color or "kanagawa-wave"
	vim.cmd.colorscheme(color)
    vim.cmd 'highlight TelescopeBorder guibg=none'
    vim.cmd 'highlight TelescopeTitle guibg=none'
end

ColorMyPencils()
