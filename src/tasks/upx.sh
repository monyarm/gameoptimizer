#!/bin/env bash

upxmin(){
    minimize "_upxmin" ${upx_conf[@]} 
}

_upxmin(){
    start_task
    
    { upx "$src" -o "$dest" || cp "$src" "$dest" ; } >> /dev/null 2>&1
    
    end_task
}
