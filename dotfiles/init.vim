" Don't use python form virualenv as it requires neovim stuff to be installed
let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python3"


" Read ~/.vimrc
"if filereadable(expand($HOME.'/.vimrc'))
"  source $HOME/.vimrc
"endif

call plug#begin('~/.vim/plugged')
" call plug#begin('~/.local/share/nvim/site/autoload/plug.vim')
" :: Appearance ::
" Classic gruvbox theme
Plug 'morhetz/gruvbox'
" Lean and mean status/tabline
Plug 'vim-airline/vim-airline'

" :: Editing :: 
" Auto close parens/quotes
Plug 'cohama/lexima.vim'
" Code snippets
Plug 'SirVer/ultisnips'
" Vim commenter
Plug 'scrooloose/nerdcommenter'
" Edit surrounding qoutes/parrents
" - {Visual}S<arg> surrounds selection
" - cs/ds<arg1><arg2> change/delete
" - cst<arg> change tag elemnt in markup
" - ys<obj><arg> surrounds text object
" - yss<arg> for entire line
Plug 'tpope/vim-surround'
" Edit with multiple cursors
" - Ctrl-n next cursor
" - Ctrl-p previous cursor
" - Ctrl-x skip cursor and move to next
Plug 'terryma/vim-multiple-cursors'
" Align text
" :Tab /=> aligns all '=>' in selection
Plug 'godlygeek/tabular'

" Matching parantheses
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" Highlight words in buffer matching the one currently under the cursor
"Plug 'RRethy/vim-illuminate' "<-- Using * instead!

" :: Files/Buffers ::
" TreeView/Explorer
Plug 'scrooloose/nerdtree'
" Fuzzy find file
Plug 'ctrlpvim/ctrlp.vim'
" Find in files
" <leader>a <arg> (see config below)
Plug 'mileszs/ack.vim'
" :Tlist to open taglist window
" :TlistClose to close taglist window
" Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

" :: Git ::
" Gutter signs and higlights based on git diff
Plug 'airblade/vim-gitgutter'
" Run git commands within vim
" - :Gstatus show `git status`
" - <C-n>/<C-p> next/prev file
" - - add/reset file under cursor
" - ca :Gcommit --amend
" - cc :Gcommit
" - D : Gdiff
" - :Gcommit for committing
" - :Gblame run blame on current file
Plug 'tpope/vim-fugitive'

" :: General Coding ::
" Async Launguage Server client. (Language agnostic)
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" Note: async.vim is required and is used to normalize jobs between vim8 and neovim.
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'

Plug 'KabbAmine/vCoolor.vim'
Plug 'lilydjwg/colorizer'

" Async completion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-path'

" Needed when using vim-lsp
" Plug 'ncm2/ncm2-vim-lsp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,preview,noselect

Plug 'ncm2/ncm2-html-subscope'

" Async code formatting
" :Neoformat <opt_formatter> for entire file
" :Neoformat! <filetype> for visual selection
Plug 'sbdchd/neoformat', { 'on': ['Neoformat'] }
Plug 'Shougo/echodoc.vim'

" Async lint engine
Plug 'w0rp/ale'

" :: Scala ::
" Scala syntax highlighting and formatting
Plug 'derekwyatt/vim-scala'
" Auto format scala code on save
Plug 'rompetroll/vim-scalariform'

" :: Rust ::
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'phildawes/racer'

" :: Typescript ::
" Highlighting and indent support
" " Plug 'leafgarland/typescript-vim', { 'for': ['typescript']}
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" let g:typescript_indent_disable=1
" Plug 'jason0x43/vim-js-indent'

" JS highlighting and indent support. Sometimes buggy, but has support for
" jsdocs and flow
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
" JS Completion clients for nvim-completion
" Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}

" Golang autocompletion daemon compatible with nvim-completion-manager.
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugged/gocode/nvim/symlink.sh' }

"" Web
" Mustache and Handlebars
Plug 'mustache/vim-mustache-handlebars'
" Emmet (HTML + CSS)
" ex: html:5 <CR-Y>
" ex: div#foo$*2>div.bar>{baz} <CR-Y>
Plug 'mattn/emmet-vim'

"" Vue
Plug 'posva/vim-vue'

"" Terraform
Plug 'hashivim/vim-terraform'

" All of your Plugs must be added before the following line
call plug#end()              " required

" Non-Plug stuff after this line
" ================================
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
end
set t_Co=256
colorscheme gruvbox
set background=dark
set signcolumn=yes

" close preview window after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" --------------------
" airline 
" --------------------
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2

" --------------------
" nerdtree
" --------------------
" map <C-n> :NERDTree<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeToggle="<F2>"
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" --------------------
" nerdcommenter 
" --------------------
let g:NERDSpaceDelims = 1 "jump in one step after delimiter

" --------------------
" CtrlP
" --------------------
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

" --------------------
" Multiple curstors - a little hack to make it work naturally with deoplete 
" --------------------
function Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction

" --------------------
" ncm2 
" --------------------
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'

" --------------------
" LanguageClient 
" --------------------

" Automatically start language servers.
let g:LanguageClient_autoStart = 1
let g:LanguageClient_signColumnAlwaysOn = 1
let g:LanguageClient_diagnosticsList = 'Location'

augroup LanguageClientConfig
  autocmd!

  " <leader>ld to go to definition
  autocmd FileType scala,rust,javascript,jsx,tsx,python,typescript,json,css,less,html,vue nnoremap <buffer> <leader>ld :call LanguageClient_textDocument_definition()<cr>
  " <leader>li to go to implementation
  autocmd FileType scala,rust,javascript,jsx,tsx,python,typescript,json,css,less,html,vue nnoremap <buffer> <leader>li :call LanguageClient_textDocument_implementation()<cr>
  " <leader>lt to go to type definition
  autocmd FileType scala,rust,javascript,jsx,tsx,python,typescript,json,css,less,html,vue nnoremap <buffer> <leader>lt :call LanguageClient_textDocument_typeDefinition()<cr>
  " <leader>lf to autoformat document
  autocmd FileType scala,rust,javascript,jsx,tsx,python,typescript,json,css,less,html,vue nnoremap <buffer> <leader>lf :call LanguageClient_textDocument_formatting()<cr>
  autocmd FileType scala,rust,python,typescript,css,less,html vnoremap <buffer> <leader>lf :call LanguageClient_textDocument_rangeFomatting()<cr>
  " <leader>lh for type info under cursor
  autocmd FileType scala,rust,javascript,jsx,tsx,python,typescript,json,css,less,html,vue nnoremap <buffer> <leader>lh :call LanguageClient_textDocument_hover()<cr>
  " <leader>lr to rename variable under cursor
  autocmd FileType scala,rust,javascript,jsx,tsx,python,typescript,json,css,less,html,vue nnoremap <buffer> <leader>lr :call LanguageClient_textDocument_rename()<cr>
  " <leader>lc to switch omnifunc to LanguageClient
  autocmd FileType scala,rust,javascript,jsx,tsx,python,typescript,json,css,less,html,vue nnoremap <buffer> <leader>lc :setlocal omnifunc=LanguageClient#complete<cr>
  " <leader>ls to fuzzy find the symbols in the current document
  autocmd FileType scala,rust,javascript,jsx,tsx,python,typescript,json,css,less,html,vue nnoremap <buffer> <leader>ls :call LanguageClient_textDocument_documentSymbol()<cr>
  " <leader>lw to fuzzy find the symbols in entire workspace
  autocmd FileType scala,rust,python,typescript,css,less,html,vue nnoremap <buffer> <leader>lw :call LanguageClient_textDocument_workspace_symbol()<cr>

  " Use omnifunc by default
  autocmd FileType scala,rust,javascript,jsx,tsx,python,vue setlocal omnifunc=LanguageClient#complete

augroup END


" Required for operations modifying multiple buffers like rename.
set hidden 


" if executable('javascript-typescript-stdio')
"   let g:LanguageClient_serverCommands = {
"     \'javascript':['javascript-typescript-stdio'],
"     \'javascript.jsx':['javascript-typescript-stdio'],
"     \'typescript':['javascript-typescript-stdio'],
"     \'html':['html-languageserver', '--stdio'],
"     \'css':['css-languageserver', '--stdio'],
"     \'less':['css-languageserver', '--stdio'],
"     \'json':['json-languageserver', '--stdio']
"     \}
" else
"   let g:LanguageClient_serverCommands = {}
" endif

if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands = {
    \'javascript':['javascript-typescript-stdio'],
    \'javascript.jsx':['javascript-typescript-stdio'],
    \'html':['html-languageserver', '--stdio'],
    \'css':['css-languageserver', '--stdio'],
    \'less':['css-languageserver', '--stdio'],
    \'json':['json-languageserver', '--stdio']
    \}
else
  let g:LanguageClient_serverCommands = {}
endif

if executable('typescript-language-server')
  let g:LanguageClient_serverCommands.typescript = ['typescript-language-server', '--stdio'] 
endif

if executable('rls')
  let g:LanguageClient_serverCommands.rust = ['rustup', 'run', 'nightly', 'rls'] 
endif

if executable('vls')
  let g:LanguageClient_serverCommands.vue = ['vls'] 
endif

if executable('pyls')
  let g:LanguageClient_serverCommands.python = ['pyls'] 
endif

if executable('$GOPATH/bin/go-langserver')
  let g:LanguageClient_serverCommands.go = ['$GOPATH/bin/go-langserver']
endif

let g:LanguageClient_serverCommands.scala = ['node', expand('~/.local/bin/sbt-server-stdio.js')]


" " --------------------
" " vim-lsp 
" " --------------------
" if executable('pyls')
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ })
" endif

" if executable('javascript-typescript-stdio')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'javascript-typescript-stdio',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio']},
"         \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"         \ 'whitelist': ['typescript'],
"         \ })
" endif
" let g:lsp_signs_error = {'text': '✗'}

" --------------------
" Ale
" --------------------
let g:ale_fixers = {
\   'typescript': ['eslint', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
nmap <leader>af <Plug>(ale_fix)
let g:ale_fix_on_save = 0

" --------------------
" React 
" --------------------
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" --------------------
" HTML 
" --------------------
" let g:user_emmet_leader_key='<C-E>' " Default is <C-Y>

" --------------------
" ultisnips 
" --------------------
let g:UltiSnipsSnippetsDirectories=["~/.config/nvim/UltiSnips"]
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsListSnippets="<c-k>"
let g:UltiSnipsExpandTrigger="<Plug>(ultisnips_expand_or_jump)"
let g:UltiSnipsJumpForwardTrigger="<Plug>(ultisnips_expand_or_jump)"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

function! UltiSnipsExpandOrJumpOrTab()
  call UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return ""
  else
    return "\<Tab>"
  endif
endfunction

inoremap <silent> <expr> <Tab> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_try_expand)")
inoremap <silent> <Plug>(ultisnips_try_expand) <C-R>=UltiSnipsExpandOrJumpOrTab()<CR>
snoremap <silent> <Tab> <Esc>:call UltiSnips#ExpandSnippetOrJump()<cr>


" let g:cm_matcher = {}
" let g:cm_matcher.module = 'cm_matchers.abbrev_matcher'
" let g:cm_matcher.case = 'smartcase'
" let g:cm_completed_snippet_enable = 1
" " let g:cm_completeopt = 'menuone,noinsert,noselect,preview'
" imap <c-g> <Plug>(cm_force_refresh)

" --------------------
" gitgutter 
" --------------------
nmap <leader>hn <Plug>GitGutterNextHunk
nmap <leader>hp <Plug>GitGutterPrevHunk
nmap <leader>hu <Plug>GitGutterUndoHunk

" --------------------
" ag (the sliver searcher) 
" --------------------
if executable('ag')

  " Use Ag with Ack 
  let g:ackprg = 'ag --nogroup --nocolor --column --path-to-ignore ~/.ignore'

  " Use Ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore=*.class 
        \ --ignore=node_modules --ignore=dist --ignore=out --ignore=*.log'
endif

" Search with Ack -> actually with AG (see above)
nnoremap <leader>g :Ack<Space>
" Search for word under cursor
nnoremap <leader>G :Ack <cword><cr>

" --------------------
" Folds 
"
" zf: create new fold
" zc: close fold
" zo: open fold
" zd: delete fold
"
" example:
" f{v%zf: jump to '{' mark all until matching '}' and create fold
" --------------------
set foldcolumn=1
" Use both indent fold and manual folding
" augroup vimrc
  " au BufReadPre * setlocal foldmethod=indent
  " au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END

" Quickly open a shell below current window
nnoremap <leader>sh :below 10sp term://$SHELL<cr>

nnoremap <leader>tt :TagbarToggle<cr>

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'       : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
    \ ]
\ }

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
        \'n:tests',
    \]
\}

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'V:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

set statusline+=%{gutentags#statusline()}
