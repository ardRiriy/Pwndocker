#!/bin/sh

sudo apt-get install build-essential libc6-dbg lib32stdc++6 g++-multilib cmake gcc ipython vim net-tools curl libffi-dev libssl-dev python-dev build-essential tmux glibc-source cmake strace ltrace nasm socat netcat wget radare2 gdb gdb-multiarch netcat socat git patchelf gawk file zsh qemu bison gcc-multilib binwalk libseccomp-dev libseccomp2 seccomp proxychains openssh-server lrzsz fd-find fzf silversearcher-ag --fix-missing

# powerlevel10k
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
