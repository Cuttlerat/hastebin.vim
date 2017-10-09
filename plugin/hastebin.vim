function Hastebin() range
    if executable('xclip') && executable('jq')
        echo system('echo "'.shellescape(join(getline(a:firstline, a:lastline))), "\n").'"| xargs -0 -i curl -s -XPOST "http://hastebin.hotkosc.ru/documents" -d"{}" | jq -r .key | xargs -i echo "http://hastebin.hotkosc.ru/{}" | tr -d \\n | xclip -selection clipboard')
    endif

endfunction

xnoremap <leader>c <esc>:'<,'>:call Hastebin()<CR>

