#!/bin/env bash

copy_files(){
    #cp -an ${copy_conf[@]} "$OUT"
    echo "Copying unoptimizable files with rsync"
    rsync --ignore-existing --info=progress2 -arh  "$IN/" "$OUT"
}
