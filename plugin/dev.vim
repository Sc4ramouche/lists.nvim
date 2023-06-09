function! ReloadAlpha()
lua << EOF
    for k in pairs(package.loaded) do
        if k:match("^lists") then
            package.loaded[k] = nil
        end
    end
EOF
endfunction

" Reload the plugin
nnoremap <Leader>pra :call ReloadAlpha()<CR>

" Test plugin
nnoremap <Leader>ptt :lua require("lists").toggle_menu()<CR>
