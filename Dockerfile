FROM ubuntu:16.04

MAINTAINER Chen Yuelong <yuelong.chen.btr@gmail.com>

ARG ldc_version=0.17.1
ARG sambamba_version=0.6.9


RUN apt-get update && apt-get install -y \
        autoconf \
        automake \
        make \
        g++ \
        gcc \
        build-essential \
        zlib1g-dev \
        libgsl0-dev \
        perl \
        curl \
        git \
        wget \
        unzip \
        tabix \
        libncurses5-dev && \
    cd /tmp/ && \
    wget -c https://github.com/ldc-developers/ldc/releases/download/v$ldc_version/ldc2-$ldc_version\-linux-x86_64.tar.xz && \
    tar xJf ldc2-$ldc_version\-linux-x86_64.tar.xz && \
    cp ldc2-$ldc_version\-linux-x86_64/bin/* /usr/local/bin && \
    cp ldc2-$ldc_version\-linux-x86_64/lib/* /usr/local/lib && \
    wget -c https://github.com/biod/sambamba/releases/download/v$sambamba_version/sambamba-$sambamba_version\-linux-static.gz && \
    gzip -d sambamba-$sambamba_version\-linux-static.gz && \
    chmod +x sambamba-$sambamba_version\-linux-static && \
    mv sambamba-$sambamba_version\-linux-static /usr/local/bin/sambamba

RUN apt-get clean && \
    apt-get remove -y git wget unzip gcc g++ make automake autoconf && \
    rm -rf /tmp/*


CMD bash