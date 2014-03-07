syntax on
filetype plugin indent on
au BufNewFile,BufRead *.hdbs set filetype=html
au BufRead,BufNewFile Capfile set filetype=ruby


" colorscheme Tomorrow-Night
colorscheme Tomorrow-Night2

set shell=/bin/sh

let g:airline_theme='wombat'

" Remove file browser banner
let g:netrw_banner=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
" Always show the statusbar
set laststatus=2

set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands

" Numbers
set number
set numberwidth=5

set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                     " display incomplete commands

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*/vendor/*,*/doc/*,*/tmp/*


"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set nobackup
set noswapfile
" set backupdir=~/.vim/vimswap
set directory=~/.vim/tmp
set guioptions=egmt
set guifont=monaco:h10

" map <Left> :echo "no!"<cr>
" map <Right> :echo "no!"<cr>
" map <Up> :echo "no!"<cr>
" map <Down> :echo "no!"<cr>


highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

imap <c-l> <space>=><space>

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Open the quickfix window after grep
autocmd QuickFixCmdPost *grep* cwindow

" Quickfix list
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>

"" EDIT VIMRC IN NEW TAB
map <F11> :tabe ~/.vimrc

if has("autocmd")
  " Source the vimrc file after saving it
  autocmd bufwritepost .vimrc source $MYVIMRC

  " Restore cursor position when opening a file
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

"" COMMAND-T
let g:CommandTMaxHeight=12
let g:CommandTMatchWindowReverse=1
let g:CommandTMaxFiles=40000

"" 80 CHAR COLUMN
set textwidth=80
set colorcolumn=+1
" hi ColorColumn guibg=#2d2d2d ctermbg=black
hi ColorColumn ctermbg=234 guibg=#2c2d27
" let &colorcolumn=join(range(1,80),",")
" hi colorcolumn ctermbg=233

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
noremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

autocmd BufWritePre *.rb,*.js,*.erb,*.scss :%s/\s\+$//e

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

nnoremap ; :


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>l :call RunTestFile()<cr>
noremap <leader>; :call RunNearestTest()<cr>
noremap <leader>o :call RunTests('')<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
    let in_lotus_test_file = match(expand("%"), '\(_spec.js\)$') != -1
    if in_test_file
      :silent !echo 'in_test_file'
      call SetTestFile()
      call RunTests(t:grb_test_file . command_suffix)
    elseif in_lotus_test_file
      :silent !echo 'in_lotus_test_file'
      call SetTestFile()
      call RunLotusTests(t:grb_test_file . command_suffix)
    elseif !exists("t:grb_test_file")
      :silent !echo 'else'
      let t:grb_test_file = AlternateForCurrentFile()
      call RunTests(t:grb_test_file . command_suffix)
    end
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunLotusTests(filename)
  if filereadable(a:filename)
    :w
  end

  :silent !echo;echo;echo;
  :silent !echo '----------- LOTUS TEST ------------';

  if match(a:filename, '_spec\.js$') != -1
    let something = ":!rake spec[" . a:filename ."]"
    exec something
  end
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename

    if filereadable(a:filename)
      :w
    end

    :silent !echo;echo;echo;
    :silent !echo '-----------------------';

    if match(a:filename, '_test\.rb$') != -1
        exec ":!testrbl " . a:filename
    else
        exec ":!bundle exec rspec " . a:filename
    end
endfunction


command! -nargs=? -range Align <line1>,<line2>call AlignSection('<args>')
vnoremap <silent> <Leader>a :Align<CR>
function! AlignSection(regex) range
  let extra = 1
  let sep = empty(a:regex) ? '=' : a:regex
  let maxpos = 0
  let section = getline(a:firstline, a:lastline)
  for line in section
    let pos = match(line, ' *'.sep)
    if maxpos < pos
      let maxpos = pos
    endif
  endfor
  call map(section, 'AlignLine(v:val, sep, maxpos, extra)')
  call setline(a:firstline, section)
endfunction

function! AlignLine(line, sep, maxpos, extra)
  let m = matchlist(a:line, '\(.\{-}\) \{-}\('.a:sep.'.*\)')
  if empty(m)
    return a:line
  endif
  let spaces = repeat(' ', a:maxpos - strlen(m[1]) + a:extra)
  return m[1] . spaces . m[2]
endfunction

map <Leader>gg :Ggrep -e '<C-R>=expand("<cword>")<Enter>'<Enter>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
runtime vundle.vim

" CtrlP
nnoremap <silent> <C-t> :CtrlP<CR>
