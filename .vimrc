filetype plugin indent on
set number
set ai
set incsearch
set ignorecase
set background=dark
set t_Co=256
set mouse=a
set nobackup
set nowb
set noswapfile
set nocompatible
set fillchars+=vert:\ 
colorscheme vividchalk
"Status line 
set statusline=%t\ 
set statusline+=%m
set statusline+=%c,
set statusline+=%l/%L

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'tpope/vim-fugitive'
  Plugin 'airblade/vim-gitgutter'
call vundle#end() 

let g:pydiction_location = "/home/dimitris/.vim/bundle/pydiction/complete-dict"
let g:ycm_global_ycm_extra_conf = "/home/dimitris/dev/cloudera/Impala/.ycm_extra_conf.py"
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1
let g:loaded_sql_completion = 0
let g:omni_sql_no_default_maps = 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
""Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_auto_trigger = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info
let g:EclimCompletionMethod = 'omnifunc'

let g:airline_section_y = ''
let g:airline_theme='papercolor'
let g:airline_mode_map = {'n' : 'N', 'i' : 'I', 'v' : 'V', 'V' : 'V'}
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let mapleader = ","

let g:gitgutter_max_signs = 2000

"Buffer management
set hidden

set runtimepath^=~/.vim/bundle/ctrlp.vim

" CtrlP Configuration
"==============================================================================
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=200000
let g:ctrlp_root_directory = '/home/dimitris/dev/cloudera/Impala'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.m2$\|testdata$\|fe\/target$\|thirdparty$\|\.vim$\|cluster_logs$\|logs$',
  \ 'file': '\v\.(o|so|class|jar|css|pyc|txt|log)$',
  \ }

" Use a leader instead of the actual named binding
nmap <leader>cc :CtrlP /home/dimitris/dev/cloudera/Impala<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Buffergator Configuration 
"==============================================================================
" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

autocmd Filetype c,cpp set comments^=:///
"Mappings Tmux

map <Esc>[B <Down>
nnoremap <silent> <ESC>A <up>
nnoremap <silent> <ESC>B <down>
nnoremap <silent> <ESC>C <left>
nnoremap <silent> <ESC>D <right>
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>

map [1;2D <S-left>
map [1;2C <S-right>
map <space> /
map <c-space> ?
"map <S-left> :tabp<cr>
map <S-left> :bprevious<cr>
"map <S-right> :tabn<cr>
map <S-right> :bnext<cr>

map [1;5D <C-Left>
map [1;5C <C-Right>

map <M-right> <C-]>
map <M-left> <C-t>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <S-t> :TagbarToggle<CR>
vmap <S-n> :w! ~/.vbuf<CR>
nmap <S-n> :.w! ~/.vbuf<CR>
nmap <S-m> :r ~/.vbuf<CR>
map <F1> :NERDTreeToggle<CR>
map <F2> :match ErrorMsg '\%>90v.\+'<CR>
imap <C-i> <C-x><C-u>

"Delete trailing spaces function
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc

function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	en
	return ''
endfunction

"File types on which deleting trailing spaces is enforced
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.cc :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.hh :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.java :call DeleteTrailingWS()
autocmd BufWrite *.test :call DeleteTrailingWS()
autocmd BufWrite *.thrift :call DeleteTrailingWS()
autocmd BufWrite *.y :call DeleteTrailingWS()
autocmd BufWrite *.sql :call DeleteTrailingWS()
autocmd BufWrite *.sh :call DeleteTrailingWS()
autocmd BufWrite *.md :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()

call pathogen#infect()

" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})

" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end

  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0

  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end

  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"

  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')

  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec

      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end

  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end

  " echo msg
  let @"=reg_saved
endfunction

set autoread
let autoreadargs={'autoread':1}
execute WatchForChanges("*",autoreadargs)

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

augroup filetype
	au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>89v.\+', -1)
