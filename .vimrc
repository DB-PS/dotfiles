syntax enable
filetype plugin indent on
set re=0

set mouse=a

set title
set laststatus=2
set ruler

set noswapfile

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set number
set relativenumber

set cursorline
set cc=80

set incsearch
set hlsearch
set ignorecase
set smartcase

set showtabline=0

set cedit=<C-p>

"colorscheme
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
set background=dark
let g:gruvbox_italic=1
:colorscheme gruvbox

"status line
let g:lightline = {
	\'colorscheme': 'gruvbox',
\}

"LSP configuration
set completefunc=lsc#complete#complete
let g:lsc_server_commands = {
	\'c': {
		\'name': 'c',
		\'command': 'clangd',
		\'enabled': v:true,
		\'suppress_stderr': v:true,
	\},
	\'go': {
		\'name': 'go-lang',
		\'command': 'gopls serve',
		\'enabled': v:true,
		\'suppress_stderr': v:true,
	\},
	\'python': {
		\'name': 'python',
		\'command': 'pylsp',
		\'enabled': v:true,
	\},
	\'javascript': {
		\'name': 'javascript',
		\'command': 'typescript-language-server --stdio',
		\'enabled': v:true,
	\},
	\'typescript': {
		\'name': 'typescript',
		\'command': 'typescript-language-server --stdio',
		\'enabled': v:true,
	\},
	\'typescriptreact': {
		\'name': 'typescript',
		\'command': 'typescript-language-server --stdio',
		\'enabled': v:true,
	\},
	\'javascriptreact': {
		\'name': 'typescript',
		\'command': 'typescript-language-server --stdio',
		\'enabled': v:true,
	\},
	\'java': {
		\'name': 'java',
		\'command': 'jdtls',
		\'enabled': v:true,
	\},
\}

set completeopt-=preview
let g:lsc_autocomplete_length = 0
let g:lsc_enable_diagnostics = v:false
let g:lsc_reference_highlights = v:true
let g:lsc_trace_level = 'off'
let g:lsc_popup_syntax = v:true

"FZF configuration
set rtp+=/opt/homebrew/opt/fzf
let g:fzf_vim={}
let g:fzf_vim.preview_window={}
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden -g "!.git/" -g "!node_modules/" -g "!*.venv/" --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"Mappings
map Y "+y
nnoremap <C-p> :<C-p>
nnoremap gF <C-W>gf
vnoremap gF <C-W>gf
nmap <leader>F :let @+ = expand("%:p")<CR>
nmap K  :LSClientShowHover<CR>
nmap ga :LSClientFindCodeActions<CR>
nmap gr :LSClientFindReferences<CR>
nmap gi :LSClientFindImplementations<CR>
nmap gc :LSClientRename<CR>
nmap gd :LSClientGoToDefinition<CR>
nmap ge :LSClientAllDiagnostics<CR>
nmap <leader>E :LSClientDisableDiagnosticHighlights<CR>
nmap E :let g:lsc_enable_diagnostics=v:true<CR>
nmap<C-f> :FZF<CR>
nmap<C-b> :Buffer<CR>
nmap<C-g> :Rg<CR>
nmap<C-l> :bwipeout<CR>
tnoremap <C-n> <C-w>N

"Commands
command LSC LSClientEnable
command LSCR LSClientRestartServer
