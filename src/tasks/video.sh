#!/bin/env bash

videomin(){
    minimize "_videomin" ${video_conf[@]}
}

_videomin(){
    start_task
    width=$(mediainfo "$src" | grep Width | awk -F ':' '{print $2}'| awk -F ' pixels' '{print $1}' | sed 's/ //g')
    height=$(mediainfo "$src" | grep Heigth | awk -F ':' '{print $2}'| awk -F ' pixels' '{print $1}' | sed 's/ //g')
    if [[ "$height" -gt 1080 ]]
    then
        additional_options="-vf scale=720:-2,setsar=1 "
    elif [[ "$width" -gt 1920 ]]
    then
        additional_options="-vf scale=1280:-1,setsar=1 "
    fi


    case $src in
        *.webm )
            ffmpeg -i "$src" -crf 40 -c:v libvpx-vp9 "$additional_options""$dest" >> /dev/null 2>&1
        ;;
        *.mp4 )
            ffmpeg -i "$src" -movflags faststart -c:v libx265 -crf 32 -preset veryfast -tag:v hvc1 "$additional_options""$dest" >> /dev/null 2>&1
        ;;
    esac
    end_task
}

