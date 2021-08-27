#!/bin/env bash

jpgmin(){
    minimize "_jpgmin" ${jpg_conf[@]} 
}

_jpgmin(){
    start_task
    
    # TODO: Use -grayscale only when image is grayscale
    node "$NODE_MODULES/jpegtran-bin/cli.js" -copy none -outfile "$temp_dir/1.jpg" "$src"
    "$NODE_MODULES/.bin/mozjpeg" -outfile "$dest" "$temp_dir/1.jpg"
    
    end_task
}