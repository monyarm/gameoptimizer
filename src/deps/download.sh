#!/bin/env bash
cd "$DEPS"
wget https://github.com/aminya/minijson/releases/download/v0.6.0/minijson-linux-x64.zip >> /dev/null
unzip minijson-linux-x64.zip -d bin >> /dev/null
rm -rf minijson-linux-x64.zip

wget -O "defluff.zip" "https://encode.su/attachment.php?attachmentid=1523&d=1302168264" >> /dev/null
unzip defluff.zip -d bin >> /dev/null
chmod +x bin/defluff
rm -rf defluff.zip

wget -O "bin/deflopt.exe" "https://github.com/branneman/SpeedyImages/raw/master/tools/nt/64bit/DeflOpt.exe" >> /dev/null
wget -O "bin/zlib.dll" "https://github.com/branneman/SpeedyImages/raw/master/tools/nt/64bit/zlib.dll" >> /dev/null
wget -O "bin/rpatool" "https://raw.githubusercontent.com/Shizmob/rpatool/master/rpatool" >> /dev/null
chmod +x bin/rpatool

wget -O "bin/lumpmod.exe" "https://github.com/Kroc/DOOM-Crusher/raw/master/bin/lumpmod/lumpmod.exe" >> /dev/null
wget -O "wadptr.rpm" "https://download.opensuse.org/repositories/openSUSE:/Factory/standard/x86_64/wadptr-2.4-13.24.x86_64.rpm"
rpm2cpio wadptr.rpm | bsdtar -xf -
mv usr/bin/* bin
chmod +x bin/wadptr
rm -rf usr
rm -rf wadptr.rpm

python -m pip install -rrequirements.txt
npm i
