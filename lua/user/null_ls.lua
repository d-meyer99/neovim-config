local status_ok, none_ls = pcall(require, "none-ls")
if not status_ok then
    return
end

local formatting = none_ls.builtins.formatting

none_ls.setup({
    sources = {
        formatting.stylua,
        formatting.rustfmt,
        formatting.prettier,
        formatting.alejandra,
        formatting.sqlfluff.with({
            extra_args = { "--dialect", "sqlite" },
        }),
        formatting.beautysh.with({
            extra_args = { "-t" },
        }),
        formatting.fourmolu,
    },
})
