#!/bin/env bash

inimin(){
    minimize "_inimin" ${ini_conf[@]}
}

_inimin(){
    start_task
    
    cat "$src" |\
    awk '(/^$/ || (NR == 1 && /^#!/) || /^[^#]/) && NF' |\
    awk '!/^;/'\
    > "$dest"
    
    end_task
}
