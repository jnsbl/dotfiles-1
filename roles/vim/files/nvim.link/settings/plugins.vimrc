" -----------------------------------------------------------------------------
" Plugin Settings - Colorscheme

set background=dark
let base16colorspace=256
colorscheme base16-flat

" -----------------------------------------------------------------------------
" Plugin Settings - Airline

let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" -----------------------------------------------------------------------------
" Plugin Settings - Bbye

nnoremap <Leader>q :Bdelete<CR>

" -----------------------------------------------------------------------------
" Plugin Settings - Startify

nnoremap <silent> <Leader>st :Startify<CR>

function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
let g:startify_custom_header = s:filter_header([
  \ ' _____             _       ',
  \ '|   | |___ ___ _ _|_|_____ ',
  \ '| | | | -_| . | | | |     |',
  \ '|_|___|___|___|\_/|_|_|_|_|',
  \ '',
  \ '',
  \ ])
let g:startify_bookmarks = [
  \ {'v': '~/.config/nvim/settings/init.vimrc'},
  \ {'g': '~/.config/nvim/settings/general.vimrc'},
  \ {'p': '~/.config/nvim/settings/plugins.vimrc'},
  \ {'u': '~/.uu/config/uu-client.properties'},
  \ {'y': '~/.pry_history'},
  \ {'h': '~/.hammerspoon/init.lua'},
  \ {'t': '~/.tmux.conf'},
  \ {'r': '~/.config/karabiner/karabiner.json'},
  \ {'w': '~/code/work/git/uu_cloudg01_c3-server-ruby/create_asids_awids.rb'},
  \ {'d': '~/.cdg_paths'},
  \ ]

" -----------------------------------------------------------------------------
" Plugin Settings - Showmarks

" Tell showmarks to not include the various brace marks (),{}, etc
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY"

" -----------------------------------------------------------------------------
" Plugin Settings - Ag

" Open the Ag command and place the cursor into the quotes
nmap ,ag :Ag ""<Left>
nmap ,af :AgFile ""<Left>

" -----------------------------------------------------------------------------
" Plugin Settings - AutoTag

" Seems to have problems with some vim files
let g:autotagExcludeSuffixes="tml.xml.text.txt.vim"

" -----------------------------------------------------------------------------
" Plugin Settings - EasyMotion

" These keys are easier to type than the default set
" We exclude semicolon because it's hard to read and
" i and l are too easy to mistake for each other slowing
" down recognition. The home keys and the immediate keys
" accessible by middle fingers are available
let g:EasyMotion_keys='asdfjkoweriop'
let g:EasyMotion_startofline = 0 " keep cursor colum JK motion

map  <Leader><Leader>s <Plug>(easymotion-bd-f)
nmap <Leader><Leader>s <Plug>(easymotion-overwin-f)

nmap <Space> <Plug>(easymotion-overwin-f2)

" -----------------------------------------------------------------------------
" Plugin Settings - Fugitive

" The tree buffer makes it easy to drill down through the directories of your
" git repository, but it’s not obvious how you could go up a level to the
" parent directory. Here’s a mapping of .. to the above command, but
" only for buffers containing a git blob or tree
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Every time you open a git object using fugitive it creates a new buffer.
" This means that your buffer listing can quickly become swamped with
" fugitive buffers. This prevents this from becomming an issue:

autocmd BufReadPost fugitive://* set bufhidden=delete

" For fugitive.git, dp means :diffput. Define dg to mean :diffget
nnoremap <silent> ,dg :diffget<CR>
nnoremap <silent> ,dp :diffput<CR>

" -----------------------------------------------------------------------------
" Plugin Settings - tComment

" extensions for tComment plugin. Normally
" tComment maps 'gcc' to comment current line
" this adds 'gcp' comment current paragraph (block)
" using tComment's built in <c-_>p mapping
nmap <silent> gcp <c-_>p

" -----------------------------------------------------------------------------
" Plugin Settings - Unimpaired

" https://github.com/carlhuda/janus/blob/master/vimrc

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" -----------------------------------------------------------------------------
" Plugin Settings - Indent Guides

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" -----------------------------------------------------------------------------
" Plugin Settings - Surround

" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`

" -----------------------------------------------------------------------------
" Plugin Settings - SplitJoin

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" -----------------------------------------------------------------------------
" Plugin Settings - YankRing

let g:yankring_history_file = '.yankring-history'
nnoremap ,yr :YRShow<CR>
nnoremap C-y :YRShow<CR>

" -----------------------------------------------------------------------------
" Plugin Settings - Deoplete

if has("python3")
  let g:deoplete#enable_at_startup = 1
else
  let g:deoplete#enable_at_startup = 0
endif

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd CompleteDone * pclose

let g:deoplete#sources = {}
let g:deoplete#sources._ = []

" Map standard Ctrl-N completion to Ctrl-Space
inoremap <C-Space> <C-n>

inoremap <expr><Space> pumvisible() ? "\<C-n>\<C-y>" : "\<Space>"

" -----------------------------------------------------------------------------
" Plugin Settings - FZF

nnoremap <silent> <Leader>zf :GFiles<cr>
nnoremap <silent> <Leader>zb :Buffers<cr>
nnoremap <silent> <Leader>zt :BTags<cr>

nnoremap <silent> <Leader>g :GFiles<cr>
nnoremap <silent> <Leader>f :Files<cr>
nnoremap <silent> <Leader>b :Buffers<cr>
nnoremap <silent> <Leader>t :BTags<cr>

" -----------------------------------------------------------------------------
" Plugin Settings - ArgWrap

nnoremap <silent> <Leader>a :ArgWrap<CR>

" -----------------------------------------------------------------------------
" Plugin Settings - vim-test

" http://stackoverflow.com/a/28524118
if $PATH !~ "\.rbenv"
    let $PATH="/Users/jnsbl/.rbenv/shims:/Users/jnsbl/.rbenv/bin:" . $PATH
endif

let test#ruby#minitest#file_pattern = 'test_.*\.rb'
let test#ruby#bundle_exec = 1

if exists("g:VimuxTmuxCommand")
  let test#strategy = "vimux"
elseif has("nvim")
  let test#strategy = "neovim"
endif

nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>ts :TestSuite<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>tv :TestVisit<CR>

" -----------------------------------------------------------------------------
" Plugin Settings - dash.vim

nmap <Leader>d <Plug>DashSearch

