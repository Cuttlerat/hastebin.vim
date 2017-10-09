if !exists('g:hastebin_host')    | let g:hastebin_host = 'http://hastebin.hotkosc.ru' | endif

function Hastebin() range
    if executable('xclip') && executable('jq')
        echo system('curl -s -XPOST "'.g:hastebin_host.'/documents" -d'.shellescape(join(getline(a:firstline, a:lastline), "\n")).' | jq -r .key | xargs -i echo "'.g:hastebin_host.'/{}" | tr -d \\n | xclip -selection clipboard')
    endif

endfunction


xnoremap <leader>c <esc>:'<,'>:call Hastebin()<CR>

