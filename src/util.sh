#!/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function size() {

    stat --printf="%s" "$1"

}

function start_task() {
    dest="$(echo "$src" | sed s#$IN#$OUT#g)"
    mkdir -p "$( dirname "$dest")"
    STARTSIZE=$(($(size "$src") ))
    temp_dir="$(mktemp -d)"

    #echo "Processing $(basename "$src")"

}


function process_files() {
    $OPTIM "$1" "$2"  >> /dev/null 2>&1
}

function end_task() {
        ENDSIZE=$(($(size "$dest") )) 
        DIFF=$(( $STARTSIZE - $ENDSIZE ))
        if [[ $DIFF  -ge 0 ]]; then
            printf "$(basename "$src") saved $GREEN$(format_size $DIFF)$GREEN$NC\n"
        fi
        rm -rf "$temp_dir"
}

function format_size() {
    echo $(numfmt --to=iec --suffix=B --padding=7 $1)
}

function cputhreads() {
    cat /proc/cpuinfo | grep processor | wc -l
}

function minimize() {
    N=$(( $(cputhreads) - 1 ))
    (
        for src in "${@:2}"; do
            ((i=i%N)); ((i++==0)) && wait
            $1 &
        done
        wait
    )

}
