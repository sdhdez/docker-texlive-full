FROM debian:testing
MAINTAINER Simon D. Hernandez <sdhdez.gh.tl@totum.one>

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            locales \
            apt-utils \
            multipath-tools && \
    apt-get clean && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/*


# Set the locale
COPY config/locale /etc/default/locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Tex Live
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            texlive-full && \
    apt-get clean && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/*

# Extras
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            vim \
            ccze \
            git \
            wget && \
    apt-get clean && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/*

# Python
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            python3 \
            python3-pip \
            python-pip \
            python3-wheel \
            python-wheel \
            python-setuptools \
            python-dev \
            python3-setuptools \
            python3-dev \
            fonts-powerline \
            powerline \
            python-powerline \
            python3-powerline \
            procps && \
    apt-get clean && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip2 1 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 2

# User add
ARG UID=1000
ARG GID=1000
ARG user=texlive
RUN useradd -u $UID -U -ms /bin/bash $user

# Environment
USER $user
ENV USER=/home/$user
ENV HOME=/home/$user
ENV APP=/home/$user/doc

# Powerline fonts
RUN cd $HOME && \
    git clone https://github.com/powerline/fonts.git --depth=1 && \
    cd fonts && \
    ./install.sh && \
    mkdir -p ~/.config/fontconfig/conf.d && \
    cd fontconfig/ && \
    cp 50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d/ && \
    cd ../.. && \
    fc-cache -vf && \
    rm -rf fonts

RUN cd $HOME && \
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf && \
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf && \
    mv PowerlineSymbols.otf $HOME/.local/share/fonts/ && \
    fc-cache -vf $HOME/.local/share/fonts/ && \
    mv 10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d/

RUN cd $HOME && \
    mkdir -p .bash/themes/agnoster-bash && \
    git clone https://github.com/speedenator/agnoster-bash.git .bash/themes/agnoster-bash

COPY config/vimrc /etc/vim/vimrc
# Home
COPY config/.bashrc $HOME/.bashrc
COPY config/.gitconfig $HOME/.gitconfig
COPY config/.vim $HOME/.vim
COPY config/.vimrc $HOME/.vimrc

USER root
RUN chown $user:$user $HOME/.bashrc && \
    chown $user:$user $HOME/.gitconfig && \
    chown $user:$user -R $HOME/.vim && \
    chown $user:$user $HOME/.vimrc && \
    chown $user:$user $HOME/.local/share/fonts/PowerlineSymbols.otf && \
    chown $user:$user $HOME/.config/fontconfig/conf.d/10-powerline-symbols.conf

USER $user

RUN cd $HOME/.vim/plugged/ale/ && git pull
RUN cd $HOME/.vim/plugged/LaTeX-Box/ && git pull
RUN cd $HOME/.vim/plugged/nerdtree/ && git pull
RUN cd $HOME/.vim/plugged/vim-airline/ && git pull
RUN cd $HOME/.vim/plugged/vim-airline-themes/ && git pull
RUN cd $HOME/.vim/plugged/vim-fugitive/ && git pull

# Application
RUN mkdir $APP
WORKDIR $APP
