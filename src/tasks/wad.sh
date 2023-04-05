#!/bin/env bash

wadmin(){
    minimize "_wadmin" ${wad_conf[@]}
}

_wadmin(){
    start_task
    
    
    python3  "$DEPS/bin/watcher.py" 'starting debugger...' wine "$DEPS/bin/lumpmod.exe" "$src" list -v | egrep "(PNG)|(JPG)" >> $temp_dir/lumps 
    
    cp "$src" "$dest"
    
    mkdir $temp_dir/in
    mkdir $temp_dir/out

    while read p; do
        name="$(echo $p | awk -F ' ' '{print $2}' | sed 's/"//g' | sed 's/[^[:print:]]//g' )"
        ext="$(echo $p | awk -F ' ' '{print $4}' | sed 's/[^[:print:]]//g' | tr '[:upper:]' '[:lower:]' )"


        python3  "$DEPS/bin/watcher.py" 'starting debugger...' wine "$DEPS/bin/lumpmod.exe" "$src" extract "$name" "$temp_dir/in/$name.$ext" >> /dev/null 2>&1
        
    done < $temp_dir/lumps

    process_files "$temp_dir/in" "$temp_dir/out"  >> /dev/null 2>&1

    while read p; do
        name="$(echo $p | awk -F ' ' '{print $2}' | sed 's/"//g' | sed 's/[^[:print:]]//g' )"
        ext="$(echo $p | awk -F ' ' '{print $4}' | sed 's/[^[:print:]]//g' | tr '[:upper:]' '[:lower:]' )"


        python3  "$DEPS/bin/watcher.py" 'starting debugger...' wine "$DEPS/bin/lumpmod.exe" "$dest" update "$name" "$temp_dir/out/$name.$ext"  >> /dev/null 2>&1
        
    done < $temp_dir/lumps

    
    yes "n" |"$DEPS/bin/wadptr" -c -nopack "$dest"  >> /dev/null 2>&1
    
    end_task
}