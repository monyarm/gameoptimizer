#!/bin/env bash
shopt -s dotglob nullglob globstar extglob nocaseglob

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

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

REALPATH="$( realpath $DIR)"
DEPS="$REALPATH/deps/"
NODE_MODULES="$DEPS/node_modules/"

. "${BASH_SOURCE%/*}/conf.sh"
. "${BASH_SOURCE%/*}/util.sh"

. "${BASH_SOURCE%/*}/tasks/copy.sh"
. "${BASH_SOURCE%/*}/tasks/del.sh"
. "${BASH_SOURCE%/*}/tasks/fallocate.sh"

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
. "${BASH_SOURCE%/*}/tasks/ini.sh"
. "${BASH_SOURCE%/*}/tasks/swf.sh"
. "${BASH_SOURCE%/*}/tasks/video.sh"

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

declare tasks=( wadmin upxmin pymin luamin xmlmin jsonmin pngmin jpgmin gifmin \
svgmin jsmin htmlmin cssmin objmin glslmin ftlmin inimin swfmin videomin archmin)

rm -rf "$OUT/*"
#mkdir $OUT

wineserver >/dev/null 2>&1
export WINEDEBUG=-all


oIFS=${IFS:-$' \t\n'} IFS=''

N=$(( $(cputhreads) - 1 ))
(
    for task in "${tasks[@]}"; do
        ((i=i%N)); ((i++==0)) && wait
        $task &
    done
    wait
)

wait

wineserver -k >/dev/null 2>&1

copy_files

delmin

fallocatetask

IFS=$oIFS

#INSIZE=$(du -bs "$IN" | grep total | awk '{print $1, $8}' || echo 0)
#OUTSIZE=$(du -bs "$OUT" | grep total | awk '{print $1, $8}' || echo 0)
INSIZE=$(find "$IN"   -type f -exec stat --printf '%b\t%B\n' "{}" \; | awk '{ total += ( $1 * $2 ) }; END { print total }' )
OUTSIZE=$(find "$OUT" -type f -exec stat --printf '%b\t%B\n' "{}" \; | awk '{ total += ( $1 * $2 ) }; END { print total }' )

SIZEDIFF=$(( $INSIZE - $OUTSIZE ))

printf "\nTotal Savings: $GREEN$(format_size $SIZEDIFF )$GREEN$NC\n"
