let g:ale_disable_lsp = 1
set shell=powershell.exe

call plug#begin()
" Plugin Section
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'
Plug 'mwistrand/vim-predawn'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-eunuch'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'curist/vim-angular-template'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'OmniSharp/omnisharp-vim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *xml, *xaml'
let g:closetag_shortcut = '>'
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2

let g:gutentags_project_root = ['angular.json' ]

let $PATH = "C:\\Program Files\\Git\\usr\\bin;" . $PATH
let g:OmniSharp_server_stdio = 1
"set clipboard+=unnamedplus

let g:spotify_token='YWM0OGY0MzM2ODk2NGM5MWE0OTM4OTI0MWE2ZDAwZDQ6NzgyZDZjZDEzZmQyNDRiOTg2MzkzYTNkMjczNGFkZDE='

"  Config Section
set encoding=utf-8
set number relativenumber
syntax enable
set noswapfile
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set cindent
set foldcolumn=1
set fileformat=unix
set textwidth=85
set colorcolumn=86
set wrap linebreak
set foldmethod=syntax
let javaScript_fold=1
set foldlevelstart=1
nnoremap j jzz
nnoremap k kzz
nnoremap G Gzz
nnoremap { {zz
nnoremap } }zz
nnoremap Y yy
nnoremap o o<Esc>zzS
nnoremap O O<Esc>zzS
nnoremap ]c ]czz
nnoremap [c [czz
let mapleader = ' '
nmap <leader>o o<Esc>zz
nmap <leader>O O<Esc>zz
nmap <leader>+ :vertical resize +10<CR>
nmap <leader>- :vertical resize -10<CR>

" theme
set background=dark
let g:gruvbox_material_disable_italic_comment=1
let g:gruvbox_material_foreground='material'
let g:gruvbox_material_background='medium'
let g:gruvbox_material_transparent_background=2
let g:gruvbox_material_dim_inactive_window=1
let g:gruvbox_material_visual='red background'
let g:gruvbox_material_better_performance=1
let g:gruvbox_material_ui_contrast='high'
let g:gruvbox_material_diagnostic_line_highlight=1
let g:gruvbox_material_colors_override = {'bg2' : ['#543937', '52']}
colorscheme gruvbox-material

let g:airline_theme='blood_red'
let g:airline_powerline_fonts=1

if (has("termguicolors"))
	set termguicolors
endif

lua require 'colorizer'.setup()

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-html', 'coc-json']
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

"Show whitespace.
set listchars=tab:>-,trail:~,space:*
set list

augroup omnisharp_commands
	autocmd!

	" Show type information automatically when the cursor stops moving.
	" Note that the type is echoed to the Vim command line, and will overwrite
	" any other messages in this space including e.g. ALE linting messages.
	autocmd CursorHold *.cs OmniSharpTypeLookup

	" The following commands are contextual, based on the cursor position.
	" autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
	autocmd FileType cs nmap <silent> <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
	autocmd FileType cs nmap <silent> <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
	autocmd FileType cs nmap <silent> <buffer> <Leader>pd <Plug>(omnisharp_preview_definition)
	autocmd FileType cs nmap <silent> <buffer> <Leader>pi <Plug>(omnisharp_preview_implementations)
	autocmd FileType cs nmap <silent> <buffer> <Leader>ot <Plug>(omnisharp_type_lookup)
	autocmd FileType cs nmap <silent> <buffer> <Leader>od <Plug>(omnisharp_documentation)
	autocmd FileType cs nmap <silent> <buffer> <Leader>of <Plug>(omnisharp_fix_usings)
	autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
	autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

	" Navigate up and down by method/property/field
	autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
	autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
	" Find all code errors/warnings for the current solution and populate the quickfix window
	autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
	" Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
	autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
	autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
	" Repeat the last code action performed (does not use a selector)
	autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
	autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

	autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

	autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

	autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
	autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
	autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

au BufReadPost *.linq set syntax=cs

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
			\: "<TAB>"


function! CheckBackspace() abort
	let col = col('.') - 1
endfunction

"Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <C-Space> coc#refresh()
else
	inoremap <silent><expr> <C-@> coc#refresh()
endif

"Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
"Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
"Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected):

"NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <F2> :NERDTreeToggle<CR>

"Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-q> :bd<CR>

"Ale
let g:ale_linters = {
			\    'python': ['flake8'],
			\    'cs': ['Omnisharp'],
			\    'html': ['angular'],
			\    'typescript': ['prettier', 'tsserver'],
			\}
let g:ale_fixers = {
			\    '*': ['remove_trailing_lines', 'trim_whitespace'],
			\    'python': ['black', 'isort'],
			\    'typescript': [
			\        'prettier',
			\        ],
			\    'css': ['prettier'],
			\    'scss': ['prettier']
			\}
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all --tab-width 4 --use-tabs true --print-width 85'
let g:ale_python_black_options = '--line-length 85'
nnoremap <leader>f :ALEFix<CR>

" FZF
" This is the default extra key bindings
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you dont like the change,
" explicitly bind the keys down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <C-f> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Customize fzf colors to match color scheme
let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }

" Get Files
command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
			\   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
			\ call fzf#vim#grep(
			\   'git grep --line-number '.shellescape(<q-args>), 0,
			\   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

augroup autoindent
	au!
	autocmd BufWritePre *.html :normal migg=G`i
augroup End
