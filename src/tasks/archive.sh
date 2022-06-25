#!/bin/env bash

archmin(){
    minimize "_archmin" ${archive_conf[@]}
}

_archmin(){
    start_task
    mkdir -p "$temp_dir/in"
    mkdir -p "$temp_dir/out"
    case $src in
        *.zip )
            extract_7z "$src" "$temp_dir/in"
        ;;
        *.apk )
            extract_7z "$src" "$temp_dir/in"
        ;;
        *.jar )
            extract_7z "$src" "$temp_dir/in"
        ;;
        *.rpa )
            extract_rpa "$src" "$temp_dir/in"
        ;;
        *.pk3 )
            extract_7z "$src" "$temp_dir/in"
        ;;
        *.epk )
            extract_7z "$src" "$temp_dir/in"
        ;;
        *.kart )
            extract_7z "$src" "$temp_dir/in"
        ;;
        *.pkz )
            extract_7z "$src" "$temp_dir/in"
        ;;
        *.pke )
            extract_7z "$src" "$temp_dir/in"
        ;;
        *.ipk3 )
            extract_7z "$src" "$temp_dir/in"
        ;;
        *.pk7 )
            extract_7z "$src" "$temp_dir/in"
        ;;
        *.ipk7 )
            extract_7z "$src" "$temp_dir/in"
        ;;
    esac
    
    process_files "$temp_dir/in" "$temp_dir/out" >> /dev/null 2>&1
    
    
    case $src in
        *.zip )
            pack_zip "$dest" "$temp_dir/out"
        ;;
        *.apk )
            pack_zip "$dest" "$temp_dir/out"
        ;;
        *.jar )
            pack_zip "$dest" "$temp_dir/out"
        ;;
        *.rpa )
            pack_rpa "$dest" "$temp_dir/out"
        ;;
        *.pk3 )
            pack_zip "$dest" "$temp_dir/out"
        ;;
        *.epk )
            pack_zip "$dest" "$temp_dir/out"
        ;;
        *.kart )
            pack_zip "$dest" "$temp_dir/out"
        ;;
        *.pkz )
            pack_7z "$dest" "$temp_dir/out"
        ;;
        *.pke )
            pack_7z "$dest" "$temp_dir/out"
        ;;
        *.ipk3 )
            pack_7z "$dest" "$temp_dir/out"
        ;;
        *.pk7 )
            pack_7z "$dest" "$temp_dir/out"
        ;;
        *.ipk7 )
            pack_7z "$dest" "$temp_dir/out"
        ;;
    esac

    end_task
}


extract_7z() {
    7za x "$1" -o"$2"  >> /dev/null 2>&1
}

extract_rpa() {
    unrpa -mp "$2" "$1" >> /dev/null 2>&1
}

pack_7z() {
    7za a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on "$1"  "$2"  >> /dev/null 2>&1
}

pack_rpa() {
    cd $2
    "$DEPS/bin/rpatool" -c "$1" * >> /dev/null 2>&1
    cd "$REALPATH"
}

pack_zip() {
    7za a -mm=Deflate -mfb=258 -mpass=15 -r "$1"  "$2/*"  >> /dev/null 2>&1

    "$DEPS/bin/defluff" < "$1" > "$temp_dir/dist.zip" 2>> /dev/null
    WINEDEBUG=-all python3  "$DEPS/bin/watcher.py" 'starting debugger...' wine "$DEPS/bin/deflopt.exe" -d -s "$(winepath -w "$temp/dist.zip")"  >> /dev/null
    cp "$temp_dir/dist.zip" "$1"
    
}
