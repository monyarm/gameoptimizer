#!/bin/env bash
shopt -s dotglob nullglob globstar extglob

OPTIM="$0"

case $1 in
    ~/*) IN="$1"
        OUT="$2"
    ;;
    /*) IN="$1"
        OUT="$2"
    ;;
    *) IN="$(pwd)/$1"
        OUT="$(pwd)/$2"
    ;;
esac

REALPATH="$( realpath ${BASH_SOURCE%/*})/src"
DEPS="$REALPATH/deps/"
NODE_MODULES="$DEPS/node_modules/"

. "${BASH_SOURCE%/*}/conf.sh"
. "${BASH_SOURCE%/*}/util.sh"

. "${BASH_SOURCE%/*}/tasks/sh.sh"
. "${BASH_SOURCE%/*}/tasks/upx.sh"
. "${BASH_SOURCE%/*}/tasks/py.sh"
. "${BASH_SOURCE%/*}/tasks/lua.sh"
. "${BASH_SOURCE%/*}/tasks/xml.sh"
. "${BASH_SOURCE%/*}/tasks/json.sh"
. "${BASH_SOURCE%/*}/tasks/png.sh"
. "${BASH_SOURCE%/*}/tasks/jpg.sh"
. "${BASH_SOURCE%/*}/tasks/gif.sh"
. "${BASH_SOURCE%/*}/tasks/svg.sh"
. "${BASH_SOURCE%/*}/tasks/js.sh"
. "${BASH_SOURCE%/*}/tasks/html.sh"
. "${BASH_SOURCE%/*}/tasks/archive.sh"
. "${BASH_SOURCE%/*}/tasks/css.sh"
. "${BASH_SOURCE%/*}/tasks/obj.sh"
. "${BASH_SOURCE%/*}/tasks/glsl.sh"
. "${BASH_SOURCE%/*}/tasks/ftl.sh"
. "${BASH_SOURCE%/*}/tasks/wad.sh"

if [[ "$1" == "--download" ]]; then
    . "$DEPS/download.sh"
    exit 0
fi;

if [[ "$1" == "--help" ]]; then
    echo "optim.sh input_folder output_folder"
    echo "  to minify files"
    echo "optim.sh --download"
    echo "  to download dependencies"
    echo "optim.sh --help"
    echo "  to show this info"
    exit 0
fi;

STARTSIZE=0
ENDSIZE=0

declare tasks=( wadmin  upxmin pymin luamin xmlmin jsonmin pngmin jpgmin gifmin \
svgmin jsmin htmlmin archmin cssmin objmin glslmin ftlmin )

rm -rf "$OUT/*"
#mkdir $OUT

wineserver

N=$(( $(cputhreads) - 1 ))
(
    for task in "${tasks[@]}"; do
        ((i=i%N)); ((i++==0)) && wait
        $task &
    done
    wait
)

wait
wineserver -k
cp -an ${copy_conf[@]} "$OUT"

#INSIZE=$(du -bs "$IN" | grep total | awk '{print $1, $8}' || echo 0)
#OUTSIZE=$(du -bs "$OUT" | grep total | awk '{print $1, $8}' || echo 0)
INSIZE=$(find "$IN" -type f -printf '%s\n'| awk '{ total += $1 }; END { print total }' )
OUTSIZE=$(find "$OUT" -type f -printf '%s\n'| awk '{ total += $1 }; END { print total }' )


SIZEDIFF=$(( $INSIZE - $OUTSIZE ))

printf "\nTotal Savings: $GREEN$(format_size $SIZEDIFF )$GREEN$NC\n"