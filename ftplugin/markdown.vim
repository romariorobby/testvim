setl ts=2 sw=2
" nnoremap <buffer><silent> ]] :call CustomSections('down', '^\# ')<CR>
" nnoremap <buffer><silent> [[ :call CustomSections('up', '^\# ')<CR>
" xnoremap <buffer><silent> [[ :<C-U>exe "norm! gv"<bar>call CustomSections('up', '^\# ')<CR>
" xnoremap <buffer><silent> ]] :<C-U>exe "norm! gv"<bar>call CustomSections('down', '^\# ')<CR>
