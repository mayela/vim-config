" dmenu
if executable('dmenu')
" Strip the newline from the end of a string
function! Chomp(str)
	return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
	"let fname = Chomp(system("if git ls-files >& /dev/null; then git ls-files | dmenu -i -l 20 -p " . a:cmd . ";fi"))
	let fname = Chomp(system("if find >& /dev/null; then find | dmenu -i -l 20 -p " . a:cmd . ";fi"))
	if empty(fname)
		return
	endif
	execute a:cmd . " " . fname
endfunction

	"map <silent> <Leader>d :call DmenuOpen("tabe")<cr>
	"cnoreabbrev dm call DmenuOpen("tabe")<cr>
	map <c-t> :call DmenuOpen("tabe")<cr>
	map <c-f> :call DmenuOpen("e")<cr>
endif
