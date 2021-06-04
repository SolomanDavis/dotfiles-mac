" Indentation preferences
set expandtab
set tabstop=4
set shiftwidth=4
set number
set smartindent
set cursorline

filetype plugin indent on
syntax on

" Set default shell to zsh
set shell=/bin/zsh

" Chroma theme
" set termguicolors
" let g:chroma_nontext_dark = 1
" colorscheme chroma

" Ayu theme - I can't decide fml
" set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

" Window and buffer settings
set hidden " If there is only one window for the current buffer, it becomes hidden when we quit
set splitright " By default creates new window to the right of the current window when splitting vertically
set splitbelow " By default creates new window below the current window when splitting horizontally

" Terminal emulator
" CTRL-e escape insert mode
tnoremap <C-e> <C-\><C-n>

" Navigate windows from any mode with Ctrl+{h,j,k,l}
"" Terminal
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
"" Insert
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
"" Normal
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use Ctrl+\ to open tag in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Open NERDTree with <Leader>[[ and focus with <Leader>ff
" On Mac <Leader> == '\'
" On Ubuntu <Leader> == 'Ctrl'
map <Leader>[[ :NERDTreeToggle<CR>
map <Leader>ff :NERDTreeFocus<CR>

" Open CHADTree with <Leader>[[ and focus with <Leader>ff
" map <Leader>[[ :CHADopen<CR>

" Custom CHADTree shortcuts
" lua vim.api.nvim_set_var("chadtree_settings", {keymap = { primary = {"o"}}})
" lua vim.api.nvim_set_var("chadtree_settings", {keymap = { v_split = {"W"}}})
" lua vim.api.nvim_set_var("chadtree_settings", {keymap = { h_split = {"I"}}})

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='dracula'

" Easy Align mappings https://github.com/junegunn/vim-easy-align
" vipga "
xmap ga <Plug>(EasyAlign)
" gaip "
nmap ga <Plug>(EasyAlign)

" Fix brace highlighting not showing: https://github.com/chriskempson/base16-vim/issues/63
hi MatchParen ctermfg=none
hi MatchParen ctermbg=none

" Session Options
let g:session_directory='~/.config/nvim/sessions'
"" Every vim instance without an explicit session loaded will overwrite the
"" default session in default.session.
let g:session_default_to_last='1' " Set default session to last session used
let g:session_autosave='yes' " Automatically save session on vim exit

" Default creation of .tex files to use tex syntax and not plaintex
" let g:tex_flavor = 'latex'

" Move through wrapped lines like normal lines when in normal mode.
" nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
" nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Deoplete.vim settings
" Enable deoplete on startup
" let g:deoplete#enable_at_startup = 1
" Use tab for autocompletion
" inoremap <expr><tab> pumvisible() ? '\<c-n>' : '\<tab>'
" Configuration with clang for deoplete - not sure what this is for...
" let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-3.8/lib/libclang.so'
" let g:deoplete#sources#clang#clang_header='/usr/lib/clang'

" Scala configuration
au BufRead,BufNewFile *.sbt set filetype=scala

" Coc.nvim configuration
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=3000

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? '\<C-y>' : '\<C-g>u\<CR>'
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab and shift-tab for autocompletion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Set python path for faster startup when switching between virtualenvs
let g:python3_host_prog = '/Users/ziyadalyafi/.pyenv/versions/py3nvim/bin/python'

" vim-go can get slow with these options enabled
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0

" Plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')

" vim-easy-align
Plug 'junegunn/vim-easy-align'

" vim-sneak
Plug 'justinmk/vim-sneak'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim-bufferline
Plug 'bling/vim-bufferline'

" git branch in statusline and various commands
Plug 'tpope/vim-fugitive'

" Differences in file
Plug 'mhinz/vim-signify'

" Latex stuff
" Plug 'LaTeX-Box-Team/LaTeX-Box'

" Ayu theme - idk if I like it more
" Plug 'ayu-theme/ayu-vim'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin' " git status flag support

" CHADTree - Better NERDTree - TODO: Figure out how to fix shortcuts and
" configuration
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}

" Comment things quickly
Plug 'tyru/caw.vim'

" Better save session that works with NERDTree
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

" Support for CoffeeScript
" Plug 'kchmck/vim-coffee-script'

" Neovim autocompletion
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Conquerer or Completetion for autocompletion using LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Scala Syntax Highlighting
Plug 'derekwyatt/vim-scala'

" GoLang Syntax Highlighting and General Support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" JSX Syntax Highlighting
" Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'

" Capslock toggle within vim
" <C-G>c in insert mode and gC in normal mode
" The difference is that gC in normal mode will persist the caps lock over
" multiple entries/exits into/from insert mode whereas <C-G>c in insert mode
" will only hold caps lock within the current insert 'session'.
Plug 'https://github.com/tpope/vim-capslock'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }  }

" Rust support
Plug 'rust-lang/rust.vim'

" Bdelete - better buffer deletion commands
Plug 'Asheq/close-buffers.vim'

" Dracula theme
Plug 'dracula/vim', {'as':'dracula'}

call plug#end()


" Dracula colorscheme
" Must be placed after plug#end() as per dracula-vim instructions
set termguicolors
colorscheme dracula
