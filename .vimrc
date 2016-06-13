set nocompatible

" --- Vim plug ---
call plug#begin('~/.vim/plugged')

" ----- Making Vim look good -----
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ----- Vim as a programmer's text editor -----
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'

" ----- Working with Git -----
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ----- Other text editing features -----
Plug 'Raimondi/delimitMate'

" ----- Tmux ------
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" ----- Syntax plugins ------
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-markdown'

" ----- Extras/Advanced plugins ------
Plug 'tpope/vim-surround'
Plug 'HTML-AutoCloseTag'
Plug 'edkolev/tmuxline.vim'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'rking/ag.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'skwp/greplace.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'

" ----- Rails & Ruby feature plugins ------
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv'
Plug 'skalnik/vim-vroom'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rake'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

" ----- Snipmate -----
Plug 'Valloric/YouCompleteMe'                  
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

let mapleader = ","
imap jj <esc>

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set hlsearch
set history=500 " keep 500 lines of command line history
set showmatch
set nowrap
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
set guifont=Triskweline_10:h10
set et
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on
set lazyredraw " Don't redraw screen when running macros"

" Use Silver Searcher instead of grep
set grepprg=ag

" Ignore stuff that can't be opened
set wildignore+=tmp/**

" --- Disable Arrow keys ----
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" --- Reset Tab size ---
set tabstop=2 shiftwidth=2 expandtab

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :sp $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

" Note that remapping C-s requires flow control to be disabled
" " (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c

syntax on

set mouse=a

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Set the colorscheme
colorscheme solarized

highlight clear SignColumn

" ----- vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
" https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" ----- jistr/vim-nerdtree-tabs
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0

let g:netrw_liststyle = 3
let g:netrw_winsize   = 15
" Don't create .netrwhist files
let g:netrw_dirhistmax = 0

nmap <leader>d :Lex<CR> 


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags
" Sensible defaults
" let g:easytags_events = ['BufReadPost', 'BufWritePost']
" let g:easytags_async = 1
" let g:easytags_dynamic_files = 2
" let g:easytags_resolve_links = 1
" let g:easytags_suppress_ctags_warning = 1
" let g:tagbar_type_ruby = {
"   \ 'kinds' : [
"     \ 'm:modules',
"     \ 'c:classes',
"     \ 'd:describes',
"     \ 'C:contexts',
"     \ 'f:methods',
"     \ 'F:singleton methods'
"   \ ]
" \ }

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
" autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- Valloric/YouCompleteMe -----
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_dont_warn_on_startup = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_filetype_blacklist = {}

let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:ycm_filetype_blacklist = {
  \ 'tagbar' : 1,
  \ 'qf' : 1,
  \ 'notes' : 1,
  \ 'markdown' : 1,
  \ 'unite' : 1,
  \ 'text' : 1,
  \ 'vimwiki' : 1,
  \ 'gitcommit' : 1,
\}

let g:ycm_error_symbol = '✘' 
let g:ycm_warning_symbol = '▲'

" ----- SirVer/ultisnips ------
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

" ------ ctrlp ------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
\ }

" ------- thoughtbot/vim-rspec -------
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm2"

"Now using thoughtbot/vim-rspec and tpope/dispatch.
let g:rspec_command = "Dispatch bin/rspec {spec}"

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <leader>= :wincmd =<CR>

" highlight code syntax
let g:markdown_fenced_languages = ['html', 'ruby', 'python', 'bash=sh']

" macros/matchit.vim
runtime macros/matchit.vim

" nelstrom/vim=textobj-rubyblock
if has("autocmd")
  filetype indent plugin on
endif
