#!/bin/env bash

jsmin(){
    minimize "_jsmin" ${js_conf[@]}
}

_jsmin(){
    start_task
    
    "$NODE_MODULES/.bin/terser" --compress --comments false --mangle --keep-classnames --keep-fnames "$src" -o "$dest" 2> /dev/null
    
    end_task
}
