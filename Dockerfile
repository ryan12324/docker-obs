FROM bandi13/gui-docker:1.5
USER root
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -y \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:obsproject/obs-studio \
    && apt-get update -y \
    && apt-get install -y wget tar ffmpeg obs-studio \
    && apt-get clean -y
    
ENV NOALBS_VERSION=v2.11.2
RUN wget https://github.com/NOALBS/nginx-obs-automatic-low-bitrate-switching/releases/download/${NOALBS_VERSION}/noalbs-${NOALBS_VERSION}-x86_64-unknown-linux-musl.tar.gz \
    && tar -xzf noalbs-${NOALBS_VERSION}-x86_64-unknown-linux-musl.tar.gz \
    && mkdir /root/noalbs \
    && mv noalbs-${NOALBS_VERSION}-x86_64-unknown-linux-musl/* /root/noalbs
    

RUN echo "?package(bash):needs=\"X11\" section=\"DockerCustom\" title=\"OBS Screencast\" command=\"obs\"" >> /usr/share/menu/custom-docker && update-menus
