vim.g.rustaceanvim = {
    tools = {},
    server = {
        on_attach = function(_, bufnr)
        end,
        default_settings = {
            ["rust-analyzer"] = {
                procMacro = {
                    enable = true,
                    attributes = {
                        track_error = "ignore",
                        track_error_legacy = "ignore"
                    }
                },
                cargo = {
                },
                check = {
                    command = "check",
                    invocationStrategy = "once",
                    extraArgs = { "--target-dir", "target/rust-analyzer" },
                },
                checkOnSave = {
                    command = "check",
                    enable = true,
                    extraArgs = { "--target-dir", "target/rust-analyzer" },
                }
            },
        },
    }
}
