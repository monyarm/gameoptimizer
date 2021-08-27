#!/bin/env bash

svgmin(){
    minimize "_svgmin" ${svg_conf[@]} 
}

_svgmin(){
    start_task
    
    "$NODE_MODULES/.bin/svgo" --multipass "$src" -o "$dest" >> /dev/null
    
    end_task
}