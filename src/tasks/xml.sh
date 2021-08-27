#!/bin/env bash

xmlmin(){
    minimize "_xmlmin" ${xml_conf[@]} 
}

_xmlmin(){
    start_task
    
    { node "$DEPS/xmlmin.js" "$src" || cat "$src"; } > "$dest"
    
    end_task
}