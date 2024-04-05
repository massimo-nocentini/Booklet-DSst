
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

BookletDSstTest new 
  testBasicObjectsNotebook;
  yourself.

Smalltalk snapshot: true andQuit: true."
