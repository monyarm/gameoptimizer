#!/bin/env bash

ftlmin(){
    minimize "_ftlmin" ${ftl_conf[@]} 
}

_ftlmin(){
    start_task
    
    { node "$DEPS/ftlmin.js" "$src" || cat "$src"; } > "$dest"
    
    end_task
}