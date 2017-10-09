function Hastebin() range
    if executable('xclip') && executable('jq')
        echo system('curl -s -XPOST "http://hastebin.hotkosc.ru/documents" -d'.system(shellescape(join(getline(a:firstline, a:lastline), "\n")).'| sed "s/\\//g"').' | jq -r .key | xargs -i echo "http://hastebin.hotkosc.ru/{}" | tr -d \\n | xclip -selection clipboard')
    endif

endfunction

xnoremap <leader>c <esc>:'<,'>:call Hastebin()<CR>

