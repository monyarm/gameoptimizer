#!/bin/env bash

glslmin(){
    minimize "_glslmin" ${glsl_conf[@]} 
}

_glslmin(){
    start_task
    
    { node "$DEPS/glslmin.js" "$src" || cat "$src"; } > "$dest" 2>/dev/null
    
    end_task
}
