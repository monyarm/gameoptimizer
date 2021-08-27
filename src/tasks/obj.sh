#!/bin/env bash

objmin(){
    minimize "_objmin" ${obj_conf[@]} 
}

_objmin(){
    start_task
    
    { node "$DEPS/objmin.js" "$src" || cat "$src"; } > "$dest"
    
    end_task
}