#!/bin/bash

#update list of packages && upgrade installed packages
apt update && apt upgrade -y

#remove unneeded packages
apt autoremove -y

#update radare2
~/radare2/sys/install.sh

#update radare2 package manager
r2pm update

#clone new RE_Challenges repo to a temporary directory
git clone https://github.com/rec-uah/RE_Challenges tmp

#update all files related to C challenges
cd ~/RE_Challenges/tmp/Challenges/C
make all
mv *.c ~/RE_Challenges/Help/C/Source-Code
mv ex* ~/RE_Challenges/Challenges/C
mv makefile ~/RE_Challenges/Help/C/Source-Code
cd ~/RE_Challenges/tmp/Help/C
mv *.docx ~/RE_Challenges/Help/C

#update all files related to C++ challenges
cd ~/RE_Challenges/tmp/Challenges/C++
make all
mv *.cpp ~/RE_Challenges/Help/C++/Source-Code
mv ex* ~/RE_Challenges/Challenges/C++
mv makefile ~/RE_Challenges/Help/C++/Source-Code
cd ~/RE_Challenges/tmp/Help/C++
mv *.docx ~/RE_Challenges/Help/C++

#update all files related to Go challenges
cd ~/RE_Challenges/tmp/Challenges/Go
make all
mv *.go ~/RE_Challenges/Help/Go/Source-Code
mv ex* ~/RE_Challenges/Challenges/Go
mv makefile ~/RE_Challenges/Help/Go/Source-Code
cd ~/RE_Challenges/tmp/Help/Go
mv *.docx ~/RE_Challenges/Help/Go

#takes all lines that are new in the updated set-up.sh and runs them (ensure new tools will be installed)
awk 'FNR==NR{a[$0];next}!($0 in a)' ~/RE_Challenges/set-up.sh ~/RE_Challenges/tmp/set-up.sh | /bin/bash

#copy all updated scripts and README.md
mv ~/RE_Challenges/tmp/set-up.sh ~/RE_Challenges
mv ~/RE_Challenges/tmp/update.sh ~/RE_Challenges
mv ~/RE_Challenges/tmp/remove.sh ~/RE_Challenges
mv ~/RE_Challenges/tmp/README.md ~/RE_Challenges

#remove tmp directory when the update is complete
rm -rf ~/RE_Challenges/tmp
