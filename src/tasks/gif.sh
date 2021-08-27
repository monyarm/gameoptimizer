#!/bin/env bash

gifmin(){
    minimize "_gifmin" ${gif_conf[@]} 
}

_gifmin(){
    start_task
    
    "$NODE_MODULES/.bin/gifsicle" --no-warnings --no-app-extensions -O3 "$src" > "$dest"
    
    end_task
}