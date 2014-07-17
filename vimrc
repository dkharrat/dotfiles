
call pathogen#infect()

set nocompatible                " choose no compatibility with legacy vi
syntax enable
colorscheme solarized
set background=dark
set t_Co=256
set encoding=utf-8
set ruler
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Leader key
let mapleader = ","

"" Searching
   " turn off vim's handling of regex in searches
nnoremap / /\v
vnoremap / /\v
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault                    " apply substitutions globally on lines
    " shortcut to clear search
nnoremap <leader><space> :noh<cr>

""List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the first column when wrap is
                                  " off and the line continues beyond the left of the screen

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  set statusline=%t               " tail of the filename
  set statusline+=[%{strlen(&fenc)?&fenc:'none'},   " file encoding
  set statusline+=%{&ff}]         " file format
  set statusline+=%h              " help file flag
  set statusline+=%m              " modified flag
  set statusline+=%r              " readonly flag
  set statusline+=%y              " filetype
  set statusline+=%=              " left/right separator
  set statusline+=%c,             " cursor column
  set statusline+=%l/%L           " cursor line/total lines
  set statusline+=\ %P            " percent through file
endif

"" ignore generated and binary files in auto-completion
set wildignore+=*.so,*.class,*.o,*.jar,*.swp,*.zip

"" search from root of project
let g:ctrlp_working_path_mode = 'ra'
" Let ctrlp search based on git index, honoring gitignore files
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

"" configure lightline plugin
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
