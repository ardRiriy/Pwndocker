FROM ubuntu:latest

RUN dpkg --add-architecture i386 && \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y tzdata && \
    apt install -y \
    build-essential \
    libc6-dbg \
    lib32stdc++6 \
    g++-multilib \
    cmake \
    gcc \
    vim \
    net-tools \
    curl \
    libffi-dev \
    libssl-dev \
    build-essential \
    tmux \
    glibc-source \
    cmake \
    strace \
    ltrace \
    nasm \
    netcat\
    wget \
    gdb \
    gdb-multiarch \
    netcat \
    socat \
    git \
    patchelf \
    gawk \
    file \
    fish \
    qemu \
    bison --fix-missing  \
    gcc-multilib \
    binwalk \
    libseccomp-dev \
    libseccomp2 \
    seccomp \
    proxychains \
    openssh-server \
    lrzsz \
    python3-pip


RUN python3 -m pip install -U pip && \
    python3 -m pip install --no-cache-dir \
    -i https://pypi.doubanio.com/simple/  \
    --trusted-host pypi.doubanio.com \
    ropper \
    unicorn \
    capstone

RUN pip install --upgrade setuptools && \
    pip install --no-cache-dir \
    -i https://pypi.doubanio.com/simple/  \
    --trusted-host pypi.doubanio.com \
    ropgadget \
    pwntools \
    zio \
    smmap2 \
    z3-solver \
    apscheduler && \
    pip install --upgrade pwntools



# Oh-my-zsh
RUN chsh -s /usr/bin/fish
RUN fish

RUN git clone https://github.com/scwuaptx/Pwngdb.git /root/Pwngdb && \
    cd /root/Pwngdb && cat /root/Pwngdb/.gdbinit  >> /root/.gdbinit && \
    sed -i "s?source ~/peda/peda.py?# source ~/peda/peda.py?g" /root/.gdbinit

RUN git clone https://github.com/TacXingXing/peda.git ~/peda && \
    cp ~/peda/.inputrc ~/

RUN git clone https://github.com/niklasb/libc-database.git libc-database && \
    cd libc-database && ./get || echo "/libc-database/" > ~/.libcdb_path

RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg &&  ./setup.sh

WORKDIR /ctf/

# COPY linux_server linux_server64  /ctf/
COPY gdbinit /root/.gdbinit

# RUN chmod a+x /ctf/linux_server /ctf/linux_server64

ENTRYPOINT ["/usr/bin/fish"]
