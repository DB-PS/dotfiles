syntax enable
filetype plugin indent on
set nocompatible
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

"set number
"set relativenumber
"set cursorline
"set cc=80

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
packadd lsp

call LspOptionsSet(#{
			\   autoComplete: v:false,
			\   autoHighlight: v:false,
			\   completionMatcher: 'fuzzy',
			\   diagSignErrorText: 'E>',
			\   diagSignHintText: 'H>',
			\   diagSignInfoText: 'I>',
			\   diagSignWarningText: 'W>',
			\   completionTextEdit: v:true,
			\   omniComplete: v:true,
			\   popupBorder: v:false,
			\   showDiagOnStatusLine: v:true,
			\   useBufferCompletion: v:true,
			\   useQuickfixForLocations: v:true,
			\ })

call LspAddServer([#{name: 'clangd',
			\   filetype: ['c', 'cpp'],
			"\   path: '/usr/bin/clangd',
			\   path: 'clangd',
			\   args: ['--background-index', '--clang-tidy']
			\ }])
call LspAddServer([#{
			\    name: 'typescriptlang',
			\    filetype: ['javascript', 'typescript', 'typescriptreact', 'javascriptreact'],
			"\    path: '/opt/homebrew/bin/typescript-language-server',
			\    path: 'typescript-language-server',
			\    args: ['--stdio'],
			\  }])
call LspAddServer([#{
			\    name: 'golang',
			\    filetype: ['go', 'gomod'],
			"\    path: '/opt/homebrew/bin/gopls',
			\   path: 'gopls',
			\    args: ['serve'],
			\  }])
call LspAddServer([#{name: 'pylsp',
			\   filetype: 'python',
			"\   path: '/opt/homebrew/bin/pylsp',
			\   path: 'pylsp',
			\   args: []
			\ }])
call LspAddServer([#{name: 'jdtls',
			\   filetype: 'java',
			"\   path: '/opt/homebrew/bin/jdtls',
			\   path: 'jdtls',
			\   args: [],
			\ }])

"FZF configuration
set rtp+=/opt/homebrew/opt/fzf
"set rtp+=/usr/local/opt/fzf
let g:fzf_vim={}
let g:fzf_vim.preview_window={}
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden -g "!.git/" -g "!node_modules/" -g "!*.venv/" --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'},
  \   <bang>0)

"Mappings
map Y "+y
nnoremap <C-p> :<C-p>
nnoremap gF <C-W>gf
vnoremap gF <C-W>gf
nmap <leader>F :let @+ = expand("%:p")<CR>
nmap K  :LspHover<CR>
nmap ga :LspCodeAction<CR>
nmap gr :LspShowReferences<CR>
nmap gi :LspGotoImpl<CR>
nmap gc :LspRename<CR>
nmap gd :LspGotoDefinition<CR>
nmap gt :LspPeekTypeDef<CR>
nmap ge :LspDiag show<CR>
nmap <leader>E :LspDiag highlight disable<CR>
nmap E :LspDiag highlight enable<CR>
nmap<C-f> :FZF<CR>
nmap<C-b> :Buffer<CR>
nmap<C-g> :Rg<CR>
nmap<C-l> :bwipeout<CR>
nmap gb :<C-u>call gitblame#echo()<CR>
tnoremap <C-n> <C-w>N

"Commands
command LSP LspServer start
command LSPR LspServer restart
command LSPC LspServer stop
