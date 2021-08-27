#!/bin/env bash

jsonmin(){
    minimize "_jsonmin" ${json_conf[@]} 
}

_jsonmin(){
    start_task
    cp "$src" "$dest"

    { "$DEPS/bin/minijson" --file "$dest" || cat "$src" > "$dest"; } 2>> /dev/null
    
    end_task
}