call plug#begin()
  " coc for tslinting, auto complete and prettier
  Plug 'neoclide/coc.nvim', {'do': 'npm install'}
call plug#end()

" coc extensions
let g:coc_global_extensions = [
 \ 'coc-tslint-plugin',
 \ 'coc-tsserver',
 \ 'coc-emmet',
 \ 'coc-css',
 \ 'coc-html',
 \ 'coc-json',
 \ 'coc-yank',
 \ 'coc-prettier',
 \ 'coc-explorer',
 \ 'coc-git'
 \]
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" Remap keys for gotos
 nmap <silent> gd <Plug>(coc-definition)
 nmap <silent> gy <Plug>(coc-type-definition)
 nmap <silent> gi <Plug>(coc-implementation)
 nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" remap :w to space key
nnoremap <space> :w<CR>

" switch back to normal mode with ff
inoremap ff <Esc>

" set autocomplete colors
hi Pmenu ctermbg=0 ctermfg=13 guibg=#333b4f

set noswapfile
set nobackup
set nowritebackup

nmap <space>a :CocCommand explorer<CR>

let loaded_netrwPlugin = 1

" git status line
set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}

set relativenumber

function! GitDiff()
	:silent write
	:silent execute '!git diff --color=always -- ' . expand('%:p') . ' | less --RAW-CONTROL-CHARS'
	:redraw!
endfunction

nnoremap <Leader>gs :call GitDiff()<CR>

set tabstop=2
set shiftwidth=2
set expandtab

nmap <leader>do <Plug>(coc-codeaction)
