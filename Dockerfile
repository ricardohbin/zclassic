FROM ubuntu:16.04

RUN apt-get update && apt-get -y install \
      build-essential pkg-config libc6-dev m4 g++-multilib \
      autoconf libtool ncurses-dev unzip git python \
      zlib1g-dev wget bsdmainutils automake
      
WORKDIR /zclassic

COPY . /zclassic

RUN ./zcutil/fetch-params.sh

RUN ./zcutil/build.sh -j$(nproc)

ENTRYPOINT ["/zclassic/src/"]
