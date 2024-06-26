set encoding=utf-8
scriptencoding utf-8

" PATHS {{{
" ------------------------------------------------------------------------------

if !isdirectory($HOME . '/.vim/backups')
  call mkdir($HOME . '/.vim/backups', 'p')
endif

set backupdir=~/.vim/backups
set backup

if !isdirectory($HOME . '/.vim/swaps')
  call mkdir($HOME . '/.vim/swaps', 'p')
endif

set directory=~/.vim/swaps

if has('persistent_undo')
  if !isdirectory($HOME . '/.vim/undo')
    call mkdir($HOME . '/.vim/undo', 'p')
  endif

  set undodir=~/.vim/undo
  set undofile
endif

" }}}

" LEADER {{{
" ------------------------------------------------------------------------------

nnoremap <space> <nop>
let mapleader=" "
let maplocalleader=","

" }}}

" EDITING {{{
" ------------------------------------------------------------------------------

" Show unprintable characters hexadecimal as <xx>.
set display+=uhex

" Don't redraw the screen while performing macros (so they run faster).
set lazyredraw

" Show line numbers relative to the current line.
set number relativenumber

" Reduce update delay when writing file to disk.
set updatetime=300

" Disable beeping and flashing on errors.
set visualbell t_vb=

" Insert single space after '.', '?', and '!' when joining.
set nojoinspaces

" Don't display lines wrapped by default.
set nowrap

if has('folding')
  " Show folds in the gutter.
  set foldcolumn=1

  " Expand all folds.
  set foldlevelstart=99

  " Fold by indentation.
  set foldmethod=indent
endif

if has('linebreak')
  " When wrapping, break at end of word rather than mid-word.
  set linebreak
end

if has('signs')
  " Always show the sign column so things don't jump around when it appears.
  set signcolumn=yes
endif

if has('syntax')
  " Show column at common boundaries.
  set colorcolumn=81,121

  " Highlight the line that the cursor is on.
  set cursorline
endif

" }}}

" INDENTATION, INVISIBLE CHARS, AND FILL CHARS {{{
" ------------------------------------------------------------------------------

" Width of a tab.
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Use spaces instead of tabs.
set expandtab

" Customize invisible chars.
set listchars=""
set listchars+=eol:¬        " shown at the end of each line
set listchars+=tab:▸\       " shown in place of a tab
if has('patch-8.2.2454')
  set listchars+=lead:·     " shown for leading spaces
endif
set listchars+=trail:·      " shown for trailing spaces
set listchars+=extends:→    " shown in the last column when line overflows
set listchars+=precedes:←   " shown in the first column when line overflows
set listchars+=conceal:•    " shown in place of concealed text
set listchars+=nbsp:·       " shown in place of a non-breakable space

" Display invisible chars.
set list

if has('folding')
  " Customize fill chars.
  set fillchars=""
  set fillchars+=stl:\         " status line of the current window
  set fillchars+=stlnc:\       " status line of the non-current windows
  set fillchars+=vert:┃        " vertical separators
  set fillchars+=fold:-        " filling 'foldtext'
  if has('patch-8.2.2524')
    set fillchars+=foldopen:▾  " mark the beginning of a fold
    set fillchars+=foldclose:▸ " show a closed fold
    set fillchars+=foldsep:│   " open fold middle character
  endif
  set fillchars+=diff:-        " deleted lines of the 'diff' option
  if has('patch-8.2.2508')
    set fillchars+=eob:\       " empty lines below the end of a buffer
  endif
  if has('patch-9.0.0656')
    set fillchars+=lastline:↓  " 'display' contains lastline/truncate
  endif
endif

if has('linebreak')
  " Shown at the start of lines that have been wrapped.
  set showbreak=↪
endif

" }}}

" SPLITS {{{
" ------------------------------------------------------------------------------

" Open new split below rather than above.
set splitbelow

" Open new vertical split to the right, rather than left.
set splitright

" }}}

" MOVEMENT {{{
" ------------------------------------------------------------------------------

" Enable use of mouse in all modes with a supported terminal.
set mouse=a

" Start vertically scrolling when 3 lines from the top or bottom.
set scrolloff=3

" How many columns to scroll at a time horizontally.
set sidescroll=1

" Start horizontally scrolling when 3 lines from the edges.
set sidescrolloff=3

" Don't reset cursor to start of line when moving around.
set nostartofline

" }}}

" SEARCHING {{{
" ------------------------------------------------------------------------------

" Global substitutions by default.
set gdefault

" Case insensitive searches...
set ignorecase
" ...unless specifically searching for something with uppercase characters.
set smartcase

if has('extra_search')
  " Highlight search matches.
  set hlsearch
endif

" Every character is special ("very magic").
nnoremap / /\v
vnoremap / /\v

" }}}

" MAPPINGS {{{
" ------------------------------------------------------------------------------

" n - Normal
" v - Visual and Select
" s - Select
" x - Visual
" o - Operator-pending
" i - Insert
" l - Insert, Command-line, Lang-Arg
" c - Command-line
" t - Terminal-Job
" None - Normal, Visual, Select, Operator-pending
"
" [nvsxoilct]noremap - Don't recursively map if recursive mapping is on
" [nvsxoilct]map
" [nvsxoilct]unmap
" [nvsxoilct]mapclear

" Happy pinkie.
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" Quickly escape to normal mode
inoremap jj <esc>
inoremap jk <esc>

" Navigate displayed lines.
nnoremap j gj
nnoremap k gk

" Navigate windows.
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Resize windows.
nnoremap <silent> <c-left> :vertical resize -2<cr>
nnoremap <silent> <c-down> :horizontal resize +2<cr>
nnoremap <silent> <c-up> :horizontal resize -2<cr>
nnoremap <silent> <c-right> :vertical resize +2<cr>

" Match bracket pairs.
"nnoremap <tab> %
"vnoremap <tab> %

" Toggle fold.
nnoremap <tab> za

" Indent / unindent.
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" Quickly write the current buffer.
nnoremap <leader>w :w<cr>

" Quickly close the current window.
nnoremap <leader>q :q<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Clear last search.
nnoremap <silent> <leader>/ :noh<cr>

" Delete a line without adding it to the yanked stack.
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d

" Yank to the end of the line.
nnoremap Y y$

" Yank and paste to the OS clipboard.
nnoremap <leader>y "+y
nnoremap <leader>Y "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>y "+y
vnoremap <leader>p "+p

" Toggle paste.
nnoremap <leader>i :set invpaste paste?<cr>

" Open terminal.
nnoremap <silent> <leader>th :horizontal terminal ++close<cr>
nnoremap <silent> <leader>tv :vertical terminal ++close<cr>

" Strip trailing whitespace.
function! TrimWhitespace()
  let l:save=winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction
nnoremap <silent> <leader>s :call TrimWhitespace()<cr>

" }}}

" AUTOSAVE {{{
" ------------------------------------------------------------------------------

" Write on many commands.
set autowriteall

" Write also on buffer leave or focus lost.
autocmd BufLeave,FocusLost * silent! wa

" }}}

" CTRLP {{{
" ------------------------------------------------------------------------------

nnoremap <silent> <leader>ff :CtrlP<cr>
nnoremap <silent> <leader>fb :CtrlPBuffer<cr>

" }}}

" NERDTREE {{{
" ------------------------------------------------------------------------------

nnoremap <silent> <leader>e :NERDTreeToggle<cr>
nnoremap <silent> <leader>o :NERDTreeFind<cr>

" Show hidden files by default.
let NERDTreeShowHidden=1

" Show on the right.
let NERDTreeWinPos='right'

" Quit if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" }}}

" RIPGREP {{{
" ------------------------------------------------------------------------------

nnoremap <leader>g :Rg<space>

" }}}

" VIMDIFF {{{
" ------------------------------------------------------------------------------

nnoremap <silent> <leader>dl :diffget LOCAL<cr>
nnoremap <silent> <leader>db :diffget BASE<cr>
nnoremap <silent> <leader>dr :diffget REMOTE<cr>

" }}}

" COLOR SCHEME {{{
" ------------------------------------------------------------------------------

if has('termguicolors')
  set termguicolors
endif

colorscheme catppuccin_mocha

" }}}

" STATUS LINE {{{
" ------------------------------------------------------------------------------

if has('statusline') && !&compatible
  " We're showing the mode in the status line.
  set noshowmode

  set statusline=
  set statusline+=%2*\ %{StatuslineMode()}\ %1*        " mode
  set statusline+=%3.3n                                " buffer number
  set statusline+=\ %<%f                               " file path
  set statusline+=%(\ %3*%h%m%r%1*%)                   " flags
  set statusline+=%(\ %4*%{fugitive#Statusline()}%1*%) " git status

  set statusline+=%=

  set statusline+=%5*\ %Y\ %1*                         " file type
  set statusline+=%6*\ 0x%04B\ %1*                     " char under cursor
  set statusline+=%7*\ %7.(%l:%v%)\ %1*                " line and column
  set statusline+=%8*\ %3.3P\ %1*                      " % through file

  let s:rosewater='#F5E0DC'
  let s:flamingo='#F2CDCD'
  let s:pink='#F5C2E7'
  let s:mauve='#CBA6F7'
  let s:red='#F38BA8'
  let s:maroon='#EBA0AC'
  let s:peach='#FAB387'
  let s:yellow='#F9E2AF'
  let s:green='#A6E3A1'
  let s:teal='#94E2D5'
  let s:sky='#89DCEB'
  let s:sapphire='#74C7EC'
  let s:blue='#89B4FA'
  let s:lavender='#B4BEFE'

  let s:text='#CDD6F4'
  let s:subtext1='#BAC2DE'
  let s:subtext0='#A6ADC8'
  let s:overlay2='#9399B2'
  let s:overlay1='#7F849C'
  let s:overlay0='#6C7086'
  let s:surface2='#585B70'
  let s:surface1='#45475A'
  let s:surface0='#313244'

  let s:base='#1E1E2E'
  let s:mantle='#181825'
  let s:crust='#11111B'

  let s:mode_map={
    \ 'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE', 'v': 'VISUAL', 'V': 'V-LINE', "\<C-v>": 'V-BLOCK',
    \ 'c': 'COMMAND', 's': 'SELECT', 'S': 'S-LINE', "\<C-s>": 'S-BLOCK', 't': 'TERMINAL'
  \ }

  function! StatuslineMode()
    return get(s:mode_map, mode(), 'NORMAL')
  endfunction

  function! StatuslineColor(group, guifg, guibg)
    execute 'highlight ' . a:group . ' guifg=' . a:guifg . ' guibg=' . a:guibg
  endfunction

  function! StatuslineColors()
    call StatuslineColor('User1', s:text,     s:mantle)    " default
    call StatuslineColor('User2', s:mantle,   s:blue)      " mode
    call StatuslineColor('User3', s:overlay2, s:mantle)    " flags
    call StatuslineColor('User4', s:mauve,    s:mantle)    " git status
    call StatuslineColor('User5', s:overlay2, s:mantle)    " file type
    call StatuslineColor('User6', s:mantle,   s:maroon)    " char under cursor
    call StatuslineColor('User7', s:mantle,   s:flamingo)  " line and column
    call StatuslineColor('User8', s:mantle,   s:rosewater) " % through file
  endfunction

  augroup StatuslineColors
    autocmd!
    autocmd VimEnter,ColorScheme * call StatuslineColors()
  augroup end
endif

" }}}

" vim: set foldmethod=marker:
