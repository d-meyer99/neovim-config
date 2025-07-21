return {
    settings = {
        texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
            build = {
                args = { "-pdf", "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f" },
                executable = "latexmk",
                forwardSearchAfter = true,
                onSave = true,
            },
            chktex = {
                onEdit = true,
                onOpenAndSave = true,
                ignoreWarnings = { 26 },
            },
            diagnosticsDelay = 300,
            forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
        },
    },
}
