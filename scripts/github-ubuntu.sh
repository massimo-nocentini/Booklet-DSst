
mkdir work
cd work
mkdir -p ~/.config/fontconfig/

echo "

<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>

<dir>/usr/local/texlive/2023/texmf-dist/fonts/</dir>
  
  <alias>
    <family>Pharo monospace</family>
    <prefer>
        <family>Source Code Pro</family>
        <family>Ubuntu Mono</family>
        <family>monospace</family>
    </prefer>
 </alias>

 <alias>
    <family>Pharo sans serif</family>
    <prefer>
        <family>Source Sans Pro</family>
        <family>Latin Modern Roman</family>
        <family>Cantarell</family>
        <family>Ubuntu</family>
    </prefer>
</alias>

 <alias>
    <family>Pharo math</family>
    <prefer>
        <family>Neo Euler</family>
    </prefer>
</alias>

 <alias>
    <family>Pharo serif</family>
    <prefer>
        <family>QTPalatine</family>
        <family>Concrete Math</family>
    </prefer>
</alias>


</fontconfig>
" > ~/.config/fontconfig/fonts.conf
fc-cache -r

wget https://github.com/massimo-nocentini/pharo-vm/releases/latest/download/pharo-vm-ubuntu.zip

unzip pharo-vm-ubuntu.zip

curl https://get.pharo.org/64/120 | bash

./pharo Pharo.image eval "
[ Metacello new
    baseline: 'BookletDSst';
    repository: 'github://massimo-nocentini/Booklet-DSst/src';
    load ] on: MCMergeOrLoadWarning do: [:warning | warning load ].

Smalltalk snapshot: true andQuit: true."

./pharo Pharo.image eval "

BookletDSstTest suite run.

Smalltalk snapshot: true andQuit: true."
