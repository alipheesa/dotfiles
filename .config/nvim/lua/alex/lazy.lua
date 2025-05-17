
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    "rebelot/kanagawa.nvim",
    "sainnhe/gruvbox-material",

    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

    -- harpoon
    { 'nvim-lua/plenary.nvim' },
    { 'ThePrimeagen/harpoon' },

    {'mbbill/undotree'},
    -- git handliing
    {'tpope/vim-fugitive'},
    {
        "rbong/vim-flog",
        lazy = true,
        cmd = { "Flog", "Flogsplit", "Floggit" },
        dependencies = {
            "tpope/vim-fugitive",
        },
    },

    'dnlhc/glance.nvim',

    {
        "hrsh7th/nvim-cmp",
        opts = {
            sources = {
                {
                    name = "html-css",
                    option = {
                        max_count = {}, -- not ready yet
                        enable_on = {
                            "html",
                            "css",
                            "jsx",
                            "tsx",
                            "vue"
                        }, -- set the file types you want the plugin to work on
                        file_extensions = { "css", "sass", "less" },
                    },
                },
            },
        },
    },
    {
        "Jezda1337/nvim-html-css",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim"
        },
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},

            -- Useful status updates for LSP.
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim'},

            -- `neodev` configures Lua LSP for your Neovim config, buildtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            { 'folke/neodev.nvim'},
        },
    },
    -- {'davidhalter/jedi-vim'},
    -- {'python-mode/python-mode'},
    {'Lokaltog/powerline'},
    { 'junegunn/fzf.vim' },
    { 'junegunn/fzf', build = ":call fsf#install()" },
    { 'mhartington/formatter.nvim' },
    { 'jose-elias-alvarez/null-ls.nvim' },
    -- codeium
    'Exafunction/codeium.vim',
    -- zen mode
    {"folke/zen-mode.nvim"},

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- Highlight todo, notes, etc in comments
    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
    -- trouble, like propose quick fix
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to the default settings
                -- refer to the configuration section below
            }
        end
    },
    -- markdown realtime priview
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {{ "iamcco/markdown-preview.nvim", build = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }},
    -- file tree
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-tree/nvim-web-devicons" },
    -- vim be good
    { "ThePrimeagen/vim-be-good" },


    --  nvim surround
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to defaults
            })
        end
    },
    -- debugger nvim-dap
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    -- DB
    "tpope/vim-dadbod",
    { "kristijanhusak/vim-dadbod-completion" },
    { "kristijanhusak/vim-dadbod-ui" },


    {
        'stevearc/aerial.nvim',
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },


    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },

    {
        "windwp/nvim-ts-autotag",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function ()
            require('nvim-ts-autotag').setup({
                -- your config
            })
        end,
        lazy = true,
        event = "VeryLazy"
    },

    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function ()
            require("lsp-zero").extend_lspconfig({

            })
        end,
        opts = {},
    },

    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end
    },

    {
        "luckasRanarison/clear-action.nvim",
        opts = {}
    },

    -- {
    --     'Wansmer/symbol-usage.nvim',
    --     event = 'BufReadPre', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    --     config = function()
    --         require('symbol-usage').setup()
    --     end
    -- },

    -- {
    --     "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    --     config = function()
    --         require("lsp_lines").setup()
    --         vim.keymap.set(
    --         "",
    --         "<Leader>l",
    --         require("lsp_lines").toggle,
    --         { desc = "Toggle lsp_lines" }
    --         )
    --     end,
    -- },

    {
        "michaelrommel/nvim-silicon",
        lazy = true,
        cmd = "Silicon",
    },

    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end,
    },

    'voldikss/vim-floaterm',

    {
        'linux-cultist/venv-selector.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
        opts = {
            name = '.venv'
        },
        event = 'VeryLazy',
        keys = {
            { '<leader>vs', '<cmd>VenvSelect<cr>' },
            { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
        },
    },


    'phaazon/hop.nvim',

    {
        "folke/flash.nvim",
        opts = {
            modes = {
                char = {
                    -- for hop.nvim like jump with y combined
                    jump_labels = true,
                    -- disable , and ; keys
                    keys = { "f", "F", "t", "T" },
                    ---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
                    char_actions = function(motion)
                        return {
                            --[[ [";"] = "next", -- set to `right` to always go right ]]
                            --[[ [","] = "prev", -- set to `left` to always go left ]]
                            -- clever-f style
                            [motion:lower()] = "next",
                            [motion:upper()] = "prev",
                        }
                    end,
                    search = { wrap = false },
                    highlight = { backdrop = true },
                    jump = { register = false },
                },
            },
        },
        event = "VeryLazy",
        keys = {
            -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    { "derektata/lorem.nvim" },
    'MunifTanjim/prettier.nvim',
    {
        "jellydn/typecheck.nvim",
        dependencies = { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
        ft = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescriptreact" },
        opts = {
            debug = true,
            mode = "trouble", -- "quickfix" | "trouble"
        },
        keys = {
            {
                "<leader>ck",
                "<cmd>Typecheck<cr>",
                desc = "Run Type Check",
            },
        }
    },

    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        lazy = false,
    },

    -- 'simrat39/rust-tools.nvim',
    -- { 'rust-lang/rust.vim', ft = { 'rust' }, init = function ()
    --     vim.g.rustfmt_autosave = 1
    -- end },

    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },


    -- {"wookayin/vim-autoimport"}
    --
    -- {
    --     'python-rope/ropevim'
    -- },
    -- 
    -- {'neoclide/coc.nvim', branch = 'release'},

    -- {
    --     "karb94/neoscroll.nvim",
    --     config = function ()
    --         require('neoscroll').setup({})
    --     end
    -- },

    {
        'nvim-flutter/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
        },
        config = true,
    },
})
