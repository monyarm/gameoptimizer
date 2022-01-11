#!/bin/env bash

delmin(){
    minimize "_delmin" ${del_conf[@]}
}

_delmin(){
    start_task
    
    rm -rf "$dest"
    
    end_task_del
}
