function _G.pcall_vimwiki_sugar()
  vim.cmd([[
    augroup vimwiki_1
      autocmd!
      au BufEnter *.wiki :syn match todoCheckbox '\v(\s+)?(-|\*|\#)\s\[\s\]'hs=e-4 conceal cchar=
      au BufEnter *.wiki :syn match todoCheckbox '\v(\s+)?(-|\*|\#)\s\[X\]'hs=e-4 conceal cchar=
      au BufEnter *.wiki :syn match todoCheckbox '\v(\s+)?(-|\*|\#)\s\[-\]'hs=e-4 conceal cchar=󰅘
      au BufEnter *.wiki :syn match todoCheckbox '\v(\s+)?(-|\*|\#)\s\[\.\]'hs=e-4 conceal cchar=⊡
      au BufEnter *.wiki :syn match todoCheckbox '\v(\s+)?(-|\*|\#)\s\[o\]'hs=e-4 conceal cchar=󰡖
      au BufEnter *.wiki :syn match todoCheckbox '\v(\s+)?(-|\*|\#)\s\[O\]'hs=e-4 conceal cchar=󰄮
      au BufEnter *.wiki :syn match bulletStar '\v(\s+)?\*'hs=e-4 conceal cchar=
      au BufEnter *.wiki :syn match bulletStar '\v(\s+)?\#'hs=e-4 conceal cchar=
      :hi def link todoCheckbox Todo
      :highlight Conceal guibg=NONE guifg=#00cf37
      :setlocal conceallevel=1
      :setlocal concealcursor=nv
    augroup END
  ]])
end

pcall_vimwiki_sugar()
