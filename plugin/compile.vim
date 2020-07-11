let g:compile_cmd = ""

fun! s:compile()
	let g:compile_cmd = input("Command to run: ", g:compile_cmd)

	call s:run()
endf

fun! s:recompile()
	if len(g:compile_cmd) == 0
		echo "Compilation command isn't set, run :Compile"
		return ''
	endif
	
	call s:run()
endf

fun! s:run()
	cexpr system(g:compile_cmd)

	let t:master_win = winbufnr(0)

	copen
	wincmd L
	execute t:master_win . "wincmd W"
endf

command! Compile call s:compile()
command! Recompile call s:recompile()
