#!/bin/env bash

fallocatetask() {
    echo "Running fallocate on files over 10M"
    minimize "_fallocate" $(find "$OUT" -size +10M -type f -print)
}

_fallocate() {
    
    STARTSIZE=$(($(size "$src") ))
    fallocate -d "$src"
    ENDSIZE=$(($(size "$src") )) 
    DIFF=$(( $STARTSIZE - $ENDSIZE ))
    if [[ $DIFF  -ge 0 ]]; then
        printf "$(basename "$src") saved\t$GREEN$(format_size $DIFF)$GREEN$NC\n"
    fi
    
}
