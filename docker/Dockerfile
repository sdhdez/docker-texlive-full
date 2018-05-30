FROM debian:testing
MAINTAINER Simon D. Hernandez <sdhdez.gh@totum.one>

# Tex Live
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            texlive-full && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

# Extras
RUN apt-get install -y --no-install-recommends \
            vim \
            ccze

# Clean
RUN apt-get clean && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/*

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

# Application
RUN mkdir $APP
WORKDIR $APP
