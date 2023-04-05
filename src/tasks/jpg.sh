#!/bin/env bash

jpgmin(){
    minimize "_jpgmin" ${jpg_conf[@]} 
}

_jpgmin(){
    start_task

    # TODO: Use -grayscale only when image is grayscale
    "$NODE_MODULES/.bin/mozjpeg" -outfile "$dest" "$src" >> /dev/null 2>&1


    end_task
}
