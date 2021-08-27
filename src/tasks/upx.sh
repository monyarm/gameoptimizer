#!/bin/env bash

upxmin(){
    minimize "_upxmin" ${upx_conf[@]} 
}

_upxmin(){
    start_task
    
    upx "$src" -o "$dest" >> /dev/null
    
    end_task
}