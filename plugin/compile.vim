let g:compile_cmd = ""

fun! s:compile()
	let g:compile_cmd = input("Command to run: ", g:compile_cmd)

	echo system(g:compile_cmd)
endf

fun! s:recompile()
	if len(g:compile_cmd) == 0
		echo "Compilation command isn't set, run :Compile"
		return ''
	endif
	
	echo system(g:compile_cmd)
endf

command! Compile call s:compile()
command! Recompile call s:recompile()
