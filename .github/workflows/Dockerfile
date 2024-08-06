FROM ubuntu:latest

ARG RGBDS_REPOSITORY
ARG RGBDS_VERSION
ARG OPENPYXL_REPOSITORY
ARG OPENPYXL_VERSION
ARG PYTHON_VERSION_NUM
ARG PYTHON_PYSPELLCHECKER_VERSION
ARG PYTHON_DATACLASSES_VERSION
ARG FLIPS_REPOSITORY
ARG FLIPS_VERSION

RUN apt-get update && \
    apt-get -qq -y install \
        software-properties-common \
        wget \
        build-essential \
        zlib1g-dev \
        libncurses5-dev \
        libgdbm-dev \
        libnss3-dev \
        libssl-dev \
        libreadline-dev \
        libffi-dev \
        byacc \
        flex \
        bison \
        pkg-config \
        libpng-dev

# Update git
RUN add-apt-repository ppa:git-core/ppa -y
RUN apt-get update
RUN apt-get -qq -y install git
RUN git --version

# Install Python
RUN wget https://www.python.org/ftp/python/$PYTHON_VERSION_NUM/Python-$PYTHON_VERSION_NUM.tgz && \
    tar xzf Python-$PYTHON_VERSION_NUM.tgz && \
    rm Python-$PYTHON_VERSION_NUM.tgz && \
    cd Python-$PYTHON_VERSION_NUM && \
    ./configure --enable-optimizations && \
    make install

# Update pip
RUN python3 -m pip install --upgrade pip

# install rgbds
RUN git clone $RGBDS_REPOSITORY ~/rgbds && \
    cd ~/rgbds && \
    git fetch --all && \
    git checkout -f $RGBDS_VERSION && \
    cd - && \
    make -C ~/rgbds clean && \
    make -C ~/rgbds && \
    make -C ~/rgbds install && \
    rm -rf ~/rgbds && \
    rgbasm --version

# install ghr
RUN wget https://github.com/tcnksm/ghr/releases/download/v0.14.0/ghr_v0.14.0_linux_amd64.tar.gz && \
    tar -xvzf ghr_v0.14.0_linux_amd64.tar.gz && \
    mv ghr_v0.14.0_linux_amd64/ghr /usr/local/bin

# install flips
RUN git clone $FLIPS_REPOSITORY ~/flips && \
    cd ~/flips && \
    git fetch --all && \
    git checkout -f $FLIPS_VERSION && \
    g++ *.c *.cpp -O3 -flto -o flips -DFLIPS_CLI && \
    mv flips /usr/bin/ && \
    cd - && \
    rm -rf flips && \
    flips --version

# install pyspellcheck
RUN python3 -m pip install pyspellchecker==$PYTHON_PYSPELLCHECKER_VERSION dataclasses==$PYTHON_DATACLASSES_VERSION

# install openpyxl
RUN git clone $OPENPYXL_REPOSITORY ~/openpyxl && \
    cd ~/openpyxl && \
    git fetch --all && \
    git checkout -f $OPENPYXL_VERSION && \
    python3 setup.py build && \
    python3 setup.py install && \
    cd - && \
    rm -rf ~/openpyxl