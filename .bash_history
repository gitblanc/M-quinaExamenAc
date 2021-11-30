sudo apt-get install openssh-server 
sudo apt-get upgrade
sudo apt-get install build-essential git mencoder valgrind
sudo mkdir /usr/src/atc
cd /usr/src/atc
sudo mkdir linmem
cd linmem/
sudo wget www.atc.uniovi.es/grado/2ac/linmem-1.0.tar
sudo tar -xf linmem-1.0.tar
sudo make install
sudo apt-get install build-essential git mencoder valgrind
sudo make install
ls
cd opt/
ls
cd ..
ls
make test
sudo make test 
ls
./test 
sudo make clean
ls
rm linmem-1.0.tar 
sudo rm linmem-1.0.tar
ls
ssh-keygen -R 156.35.151.4
sudo ssh-keygen -R 156.35.151.4
rm ~/.ssh/known_hosts.old
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get autoremove
sudo chage -d 0 student
wget http://rigel.atc.uniovi.es/grado/2ac/files/sesion2-4.tar.gz
tar xvfz sesion2-4.tar.gz
cd sesion2-4/
unlimit -c unlimited
ulimit -c unlimited
nano 2-4priv.c 
gcc -c 2-4priv.c -o 2-4priv
ls
gdb 2-4priv core
gcc -c 2-4priv.c
gcc 2-4priv -o
gcc 2-4priv.o -o 2-4priv
ls
gdb 2-4priv core
time ./2-4priv
gdb 2-4priv core
rmv 2-4priv
rm 2-4priv
ls
gcc -c 2-4priv.c
gcc 2-4priv.o -o 2-4priv
ls
rm core 
ls
gcc -c 2-4priv.c -g
gcc 2-4priv.o -o 2-4priv
ls
time ./2-4priv
gdb 2-4priv core
nano 2-4mem1.c 
gcc -c 2-4mem1.c -g
gcc 2-4mem1.o -o 2-4mem1
time ./2-4mem1
gdb 2-4mem1 core
rm core 
nano 2-4mem2.c 
gcc -c 2-4mem2.c -g
gcc 2-4mem2.o -o 2-4mem2
ls
gdb 2-4mem2 core
time ./2-4mem1
gdb 2-4mem2 core
nano 2-4mem2.c
sudo poweroff
dmesg | grep paravirt
nproc --all
ls
cd sesion2-4/
ls
sudo poweroff 
ls
gcc -c exercise6.c -o exercise6 -g
ls
gcc -c exercise6.c
gcc exercise6.c -o exercise6 -g
ls
time ./exercise6 
gdb exercise6 core
ls
time ./exercise6 
rm core
unlimit -c unlimited
ulimit -c unlimited
gdb exercise6 core
clear
ulimit -c unlimited
gcc -c exercise6.c
gcc exercise6.c -o exercise6 -g
time ./exercise6 
gdb exercise6 core
sudo poweroff
ls
wget http://rigel.atc.uniovi.es/grado/2ac/files/session3-3.tar.gz
tar xvfz session3-3.tar.gz
make bandwidth32
ls
cd bandwidth-1.3.1/
make bandwidth32
ls
sudo apt install nasm
make bandwidth32
./bandwidth32 | more
sudo nice -n -2 ./bandwidth32 --fastest
ls
gcc 3-3loc1.c -o 3-3loc1
time ./3-3loc1 
nano 3-3loc1.c
ls
nano 3-3loc2.c 
gcc -c 3-3loc2.c -o 3-3loc2
./3-3loc2 > result.txt
gcc 3-3loc2.c -o 3-3loc2
./3-3loc2 > result.txt
nano result.txt 
nano 3-3loc1.c 
gcc 3-3loc1.c -o 3-3loc1
time ./3-3loc1
nano 3-3loc1.c
gcc 3-3loc4.c -o 3-3loc4
nano 3-3loc4.c
gcc 3-3loc4.c -o 3-3loc4
time ./3-3loc4 > result4.txt
nano 3-3loc1.c
gcc 3-3loc11.c -o 3-3loc11
valgrind --tool=cachegrind ./3-3loc11
nano 3-3loc11.c
gcc 3-3loc11.c -o 3-3loc11
nano 3-3loc11.c
gcc 3-3loc11.c -o 3-3loc11
valgrind --tool=cachegrind ./3-3loc11
nano 3-3loc11.c
valgrind --tool=cachegrind ./3-3loc11
valgrind --tool=cachegrind ./3-3loc1
sudo poweroff
git pull
wget http://rigel.atc.uniovi.es/grado/2ac/files/sesion3-4.tar.gz
ls
/proc/<pid>/maps
cd sesion3-4/
ls
gcc 3-4maps.c -o 3-4maps-1
ls
time ./3-4maps-1 
gcc -static 3-4maps.c -o 3-4maps-2
time./3-4maps-2
ls
time ./3-4maps-2
ls -l 3-4maps-*
systemctl status linmem
cd /usr/src/atc/linmem
sudo make clean
sudo make install
systemctl status linmem
cd 
cd sesion3-4/
ls
nano 3-4print-vm.c 
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
gcc -Wall 3-4proclinux-1.c 3-4print-pte.c -o 3-4proclinux-1 -lmem
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
./ 3-4print-vm
./3-4print-vm
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
./3-4print-vm
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
./3-4print-vm
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
./3-4print-vm
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
./3-4print-vm
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
./3-4print-vm
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
./3-4print-vm
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
./3-4print-vm
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
nano 3-4print-pte.c
gcc 3-4print-vm.c 3-4print-pte.c -o 3-4print-vm -lmem
./3-4print-vm
sudo poweroff
cd sesion3-4/
more /proc/<pid>/maps
more /proc/<1730>/maps
more /proc/<1732>/maps
more /proc/1732/maps
more /proc/1757/maps
nano 3-4print-vm.c
nano 3-4print_pte.c
git push
ls
cd sesion3-4/
git push
git init
git add .
git commit -m "función"
git push https://bitbucket.org/eduardoblancobielsa/2ac-pl4-uo285176/src/master/
git push --set-upstream https://bitbucket.org/eduardoblancobielsa/2ac-pl4-uo285176/src/master/ master
