"==============
" ENCODING LIST
"==============
"1   latin1 8-bit characters (ISO 8859-1)
"1   iso-8859-n ISO_8859 variant (n = 2 to 15)
"1   macroman    MacRoman (Macintosh encoding)
"1   8bit-{name} any 8-bit encoding (Vim specific name)
"1   iso-2022-jp Japanese (on e-mail) -7bit
"2   cp932 Japanese (Windows only)
"2   euc-jp Japanese (Unix only)
"2   sjis Japanese (Unix only)
"2   2byte-{name} Unix: any double-byte encoding (Vim specific name)
"2   cp{number} MS-Windows: any installed double-byte codepage
"u   utf-8 32 bit UTF-8 encoded Unicode (ISO/IEC 10646-1)
"u   ucs-2 16 bit UCS-2 encoded Unicode (ISO/IEC 10646-1)
"u   ucs-2le like ucs-2, little endian
"u   utf-16 ucs-2 extended with double-words for more characters
"u   utf-16le like utf-16, little endian
"u   ucs-4 32 bit UCS-4 encoded Unicode (ISO/IEC 10646-1)
"u   ucs-4le like ucs-4, little endian
 
 
"== GENERAL ==
set nocompatible    " use vim defaults
set nowrap          " no wrap lines
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
syntax on           " syntax highlighing
 
"== ENCODE ==
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,iso-8859-15,utf-16,ucs-2-internal,ucs-2
 
"== NEW LINE ==
"UNIX=<nl> DOS=<cr><nl> MAC=<cr>
set fileformats=unix,dos,mac
 
"== SPACE TAB ==
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set expandtab       " tabs are converted to spaces, use only when required
set smarttab        " 
 
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
"set showmatch       "
 
"== SEARCH OPTION ==
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ignorecase      " ignore case when searching 
 
"== STATUS LINE ==
set laststatus=2        " allways show status line
set statusline=%F%m%r%h%w\ [ENCODING=%{&enc}]\ [FILE_FORMAT=%{&ff}]\ [SCROLL=%p]\ [LINE=%L]
 
 
"== INDENTATION ==
set autoindent     " always set autoindenting on
set smartindent     " smart indent
"set cindent        " cindent

filetype plugin indent on
 
"== COLOR SCHEME ==
colorscheme desert
 
"== KEY BINDING ==
imap <c-j> <esc>
inoremap { {<CR><BS>}<Esc>ko
inoremap ( ()<Left>
inoremap < <><Left>
 
"== FOLDING ==
au BufWrite * silent! mkview
au BufEnter * silent! loadview
nnoremap <space> za
vmap <space> za
 
"== nerdtree: auto execute ==
au vimEnter * NERDTree

"== TAG LIST ==
"let Tlist_Ctags_Cmd='/usr/bin/ctags'
"set tags=~/.vim/javatag,~/.vim/adtag
"set complete=.,w,b,u,t,i
":command Adtag set tags=~/.vim/tags/adtags
":command Jtag set tags=~/.vim/tags/jtags
 

"== FOR TEXT FILE ==
autocmd BufRead,BufNewFile *.txt setlocal wrap linebreak
 
"== MENU POPUP ==
hi Pmenu        ctermbg=darkgray ctermfg=white
hi PmenuSel     ctermbg=green ctermfg=white
hi PmenuSbar    ctermbg=white
hi PmenuThumb   ctermfg=black


"== VERTICAL SPLIT SIZE ==
nnoremap <c-l> :vertical resize -5<cr>
nnoremap <c-k> :vertical resize +5<cr>
nnoremap <c-i> :resize -5<cr>
nnoremap <c-m> :resize +5<cr>
 
" vim -b : edit binary using xxd-format!
augroup Binary
au!
au BufReadPre  *.bin let &bin=1
au BufReadPost *.bin if &bin | %!xxd
au BufReadPost *.bin set ft=xxd | endif
au BufWritePre *.bin if &bin | %!xxd -r
au BufWritePre *.bin endif
au BufWritePost *.bin if &bin | %!xxd
au BufWritePost *.bin set nomod | endif
augroup END


com! FormatJSON %!python -m json.tool


"== TAB KEY BINDS ==
nnoremap <s-t><s-o> <esc>:tabnew<cr>
nnoremap <s-t><s-n> <esc>:tabnext<cr>
nnoremap <s-t><s-p> <esc>:tabprevious<cr>
nnoremap <s-t><s-c> <esc>:tabclose<cr>
nnoremap <s-t><s-a> <esc>:tabonly<cr>

