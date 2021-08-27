#!/bin/env bash

shmin(){
    minimize "_shmin" ${sh_conf[@]}
}

_shmin(){
    start_task
    
    cat "$src" |\
    awk '(/^$/ || (NR == 1 && /^#!/) || /^[^#]/) && NF' |\
    sed 's/function \([a-zA-Z0-9_-]*\)() */\1()/'|\
    sed ':a;N;$!ba;s/\\\n */ /g'\
    > "$dest"
    
    end_task
}