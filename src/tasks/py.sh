#!/bin/env bash

pymin(){
    minimize "_pymin" ${py_conf[@]}
}

_pymin(){
    start_task
    
    { { pyminifier -O "$src" | grep -v "# Created by pyminifier"; } || cat "$src"  > "$dest"; }  > "$dest"
    
    end_task
}