#!/bin/env bash

swfmin(){
    minimize "_swfmin" ${swf_conf[@]}
}

_swfmin(){
    start_task
    
    SWFVER=$(cat "$src" | "$DEPS/bin/swfpack" | grep version | cut -d' ' -f4)
    
    if [[ $SWFVER -le 13 ]]; then
        { { cat "$src" | "$DEPS/bin/swfpack" -c ; } || cat "$src" ; } > "$dest"
    else
        { { cat "$src" | "$DEPS/bin/swfpack" -z ; } || cat "$src" ; } > "$dest"
    fi

    end_task
}
