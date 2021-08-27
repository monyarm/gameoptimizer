#!/bin/env bash

pngmin(){
    minimize "_pngmin" ${png_conf[@]} 
}

_pngmin(){
    start_task
    

    "$NODE_MODULES/.bin/pngcrush" -q -rem gAMA -rem alla -rem cHRM -rem iCCP -rem sRGB -rem time "$src" "$temp_dir/1.png"
    "$NODE_MODULES/.bin/pngquant" --strip "$temp_dir/1.png" -o "$temp_dir/2.png" >> /dev/null 2>&1
    "$NODE_MODULES/.bin/optipng" "$temp_dir/2.png" -o7 -q -force -out "$temp_dir/3.png"
    "$NODE_MODULES/.bin/advpng" -qz4 "$temp_dir/3.png"
    "$NODE_MODULES/.bin/pngout" -q "$temp_dir/3.png" "$temp_dir/4.png"
    "$DEPS/bin/defluff" < "$temp_dir/4.png" > "$dest" 2>> /dev/null
    WINEDEBUG=-all python3  "$DEPS/bin/watcher.py" 'starting debugger...' wine "$DEPS/bin/deflopt.exe" -d -s "$dest"  >> /dev/null


    end_task
}