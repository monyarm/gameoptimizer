#!/bin/env bash
oIFS=${IFS:-$' \t\n'} IFS=''

GLOBIGNORE='$IN/**/objects/old_enemies.obj'

obj_conf=( "$IN/**/*.obj" "$IN/**/*.mtl" )

js_conf=( "$IN/**/*.js" )

html_conf=( "$IN/**/*.html" "$IN/**/*.htm" )

css_conf=( "$IN/**/*.css" )

lua_conf=( "$IN/**/*.lua" )

glsl_conf=( "$IN/**/*.glsl" )

ftl_conf=( "$IN/**/*.ftl" )

php_conf=( "$IN/**/*.php" )

py_conf=( "$IN/**/*.py" )

sh_conf=( "$IN/**/*.sh" "$IN/**/*.zsh")

png_conf=( "$IN/**/*.png" )

jpg_conf=( "$IN/**/*.jpg" "$IN/**/*.jpeg" "$IN/**/*.jpe" )

gif_conf=( "$IN/**/*.gif" )

xml_conf=( "$IN/**/*.xml" "$IN/**/*.dae" "$IN/**/*.xlf" "$IN/**/*.rss" "$IN/**/*.layout" )

svg_conf=( "$IN/**/*.svg" )

json_conf=( "$IN/**/*.json" )

upx_conf=( "$IN/**/*.x86" "$IN/**/*.x86_64" "$IN/**/*.exe" "$IN/**/*.dll" "$IN/**/*.ndll"\
    "$IN/**/*.elf" "$IN/**/*.pe" "$IN/**/*.com" "$IN/**/*.le" "$IN/**/*.sys" "$IN/**/*.so"\
    "$IN/**/*.so.*" "$IN/**/SLUS*.*" "$IN/**/SLEU*.*" "$IN/**/SLJP*.*" "$IN/**/bin/minetest"\
    "$IN/**/opensonic_bin" "$IN/**/openttd" "$IN/**/binaries/system/ActorEditor"\
    "$IN/**/binaries/system/pyrogenesis" "$IN/**/bin_unix/linux_64_client"\
    "$IN/**/bin_unix/linux_64_server" "$IN/**/bin_unix/linux_client"\
    "$IN/**/bin_unix/linux_server" "$IN/**/doomrl" "$IN/**/libs/Dwarf_Fortress"\
    "$IN/**/Funkin" "$IN/**/EDOPro" "$IN/**/freeorion/freeorion" "$IN/**/freeoriond"\
"$IN/**/freeorionca" "$IN/**/Unciv" "$IN/**/Mindustry" "$IN/**/minecraft-launcher" "$IN/**/minecraft-launcher" "$IN/**/endless-sky" )

archive_conf=( "$IN/**/*.zip" "$IN/**/*.apk" "$IN/**/*.jar" "$IN/**/*.rpa" "$IN/**/*.pk3"\
    "$IN/**/*.pkz" "$IN/**/*.pke" "$IN/**/*.ipk3" "$IN/**/*.pk7" "$IN/**/*.ipk7"  "$IN/**/*.epk" \
"$IN/**/*.kart")

wad_conf=( "$IN/**/*.wad" )

copy_conf=( "$IN/*" )
del_conf=( "$OUT/*" )


IFS=$oIFS