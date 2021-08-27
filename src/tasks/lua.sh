#!/bin/env bash

luamin(){
    minimize "_luamin" ${lua_conf[@]}
}

_luamin(){
    start_task
    
    { "$NODE_MODULES/.bin/luamin" -f "$src" || cat "$src"; }  > "$dest"
    
    end_task
}