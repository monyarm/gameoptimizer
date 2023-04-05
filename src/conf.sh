#!/bin/env bash

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

xml_conf=( "$IN/**/*.xml" "$IN/**/*.dae" "$IN/**/*.xlf" "$IN/**/*.rss" "$IN/**/*.layout"\
    "$IN/**/*.dll.config" "$IN/**/monomachineconfig" "$IN/**/config/**/*.lang"\
    "$IN/**/config/**/*.cfg" "$IN/**/billboards/*.mat" "$IN/**/entities/**/*.ent"\
    "$IN/**/fonts/**/*.fnt" "$IN/**/graphics/**/*.mat" "$IN/**/gui/**/*.skin"\
    "$IN/**/launcher/*.cfg" "$IN/**/main_menu/main/menu_bg.map" "$IN/**/maps/*.map"\
    "$IN/**/maps/*.nodes" "$IN/**/misc/*.cfg" "$IN/**/misc/*.sps" "$IN/**/misc/*.rope"\
    "$IN/**/models/**/*.mat" "$IN/**/models/**/*.ho" "$IN/**/*.dae_anim"\
    "$IN/**/particles/**/*.ps" "$IN/**/particles/materials/*.mat" "$IN/**/sounds/EnemySounds.dat" \
    "$IN/**/sounds/**/*.snt" "$IN/**/textures/**/*.mat" "$IN/**/ShippingPC-BmGame.exe.cfg")

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
    "$IN/**/freeorionca" "$IN/**/Unciv" "$IN/**/Mindustry" "$IN/**/minecraft-launcher"\
    "$IN/**/Shuggy" "$IN/**/AoW3" "$IN/**/AoW3_Debug" "$IN/**/AoW3Launcher"\
    "$IN/**/AoW3Launcher.run" "$IN/**/bms_linux" "$IN/**/srcds_linux" "$IN/**/Blob"\
    "$IN/**/Blob32" "$IN/**/ck2" )

archive_conf=( "$IN/**/*.zip" "$IN/**/*.apk" "$IN/**/*.jar" "$IN/**/*.rpa" "$IN/**/*.pk3"\
    "$IN/**/*.pkz" "$IN/**/*.pke" "$IN/**/*.ipk3" "$IN/**/*.pk7" "$IN/**/*.ipk7"  "$IN/**/*.epk" \
"$IN/**/*.kart")

wad_conf=( "$IN/**/*.wad" )

ini_conf=( "$IN/**/*.ini" "$IN/**/Engine/Localization/*/*.*"\
    "$IN/**/RascalGame/Localization/*/*.*" "$IN/**/BmGame/Localization/*/*.*"\
    "$IN/**/LOTDGame/Localization/*/*.*"  )

copy_conf=()

del_conf=( "$OUT/**/soundtrack/Afterfall InSanity - Music Inspired by the Game/*.mp3"\
    "$OUT/**/soundtrack/Afterfall InSanity Original Soundtrack - Extended Edtion/*.mp3"\
    "$OUT/**/soundtrack/Afterfall InSanity - Music Inspired by the Game/*.jpg"\
    "$OUT/**/soundtrack/Afterfall InSanity Original Soundtrack - Extended Edtion/*.jpg"\
    "$OUT/**/soundtrack/Afterfall InSanity - Music Inspired by the Game/*.txt"\
    "$OUT/**/soundtrack/Afterfall InSanity Original Soundtrack - Extended Edtion/*.txt"\
    "$OUT/**/Digital Extras/**/*.*" "$OUT/**/ORIGINAL SOUNDTRACK/**/*.*" "$OUT/**/Bonus/OST/**/*.*"\
    "$OUT/**/super_secret.rar"\
    "$OUT/**/*/amdcpusetup.exe" "$OUT/**/redist/directx/*.dll" "$OUT/**/Drivers/directx/*.dll"\
    "$OUT/**/redist/dotnet/*.exe" "$OUT/**/redist/dotnet/*.dll"\
    "$OUT/**/*/vc*redist_x64.exe" "$OUT/**/*/vc*redist_x86.exe" "$OUT/**/*/PhysX*.exe"\
    "$OUT/**/DirectX*/*.cab" "$OUT/**/DirectX*/*.exe"\
    "$OUT/**/Engine/Extras/Redist/**/*.exe" "$OUT/**/Engine/Extras/Redist/**/*.dll"\
    "$OUT/**/Engine/Extras/Redist/**/*.cab"\
    "$OUT/**/PhysX/*.exe" "$OUT/**/PhysX/*.cab"\
    "$OUT/**/Support/OpenAL/*.exe" "$OUT/**/Support/Direct/*.dll"\
    "$OUT/**/*Readme*.txt" "$OUT/**/*Change*Log*.txt" "$OUT/**/*EULA*.txt" "$OUT/**/*EULA*.rtf"\
    "$OUT/**/*Manual*.rtf" "$OUT/**/*Manual*.pdf" "$OUT/**/Remember - Short Story Collection.pdf"\
    "$OUT/**/QuickInfo.pdf" "$OUT/**/*Readme*.rtf" "$OUT/**/LGPL License.txt" "$OUT/**/Bonus/Dead.Effect.2*.pdf"\
    "$OUT/**/Notice WebKit.txt" "$OUT/**/COPYING" "$OUT/**/COPYING-LGPL-2.1"\
    "$OUT/**/COPYING-MPL-1.1" \
    "$OUT/**/Help/DeusEx.ico" "$OUT/**/Help/Logo.bmp" "$OUT/**/Help/LogoSmall.bmp" "$OUT/**/Help/MPAdmin.htm"\
    "$OUT/**/Help/MPMap.htm" "$OUT/**/Help/PatchFix.htm" "$OUT/**/Help/ReadMe.htm"\
    "$OUT/**/Help/ReadMeMPStrategy.htm" "$OUT/**/Help/ReadMeMultiplayer.htm" "$OUT/**/Help/ReadMePatch1.htm"\
    "$OUT/**/Manual/ar405eng.exe" "$OUT/**/Manual/Deus Ex Manual v6.pdf" \
    "$OUT/**/Manual/Deus EX newspaper v2.pdf" "$OUT/**/Manual/Manual Cover v.5.pdf" )

swf_conf=( "$IN/**/*.swf" )
