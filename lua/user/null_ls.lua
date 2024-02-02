local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
    sources = {
        formatting.stylua,
        formatting.rustfmt,
        formatting.prettier,
        formatting.sqlfluff.with({
            extra_args = { "--dialect", "sqlite" },
        }),
        formatting.beautysh.with({
            extra_args = { "-t" },
        }),
        formatting.fourmolu,
    },
})
