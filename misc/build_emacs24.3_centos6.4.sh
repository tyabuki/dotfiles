# for centos 6.5 amd64

yum install gcc make ncurses-devel
wget http://public.p-knowledge.co.jp/gnu-mirror/gnu/emacs/emacs-24.3.tar.xz
tar xvf emacs-24.3.tar.xz
cd emacs-24.3
#./configure --without-sound --without-x --without-selinux CC='clang' CXX='clang++' CFLAGS='-O3' CPPFLAGS='-O3'
./configure --without-sound --without-x --without-selinux CFLAGS='-O3' CPPFLAGS='-O3'
make -j 3
sudo make install
