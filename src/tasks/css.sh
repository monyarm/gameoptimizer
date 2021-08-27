#!/bin/env bash

cssmin(){
    minimize "_cssmin" ${css_conf[@]}
}

_cssmin(){
    start_task
    
    "$NODE_MODULES/.bin/cleancss" -O2 -o "$dest" "$src"
    
    end_task
}