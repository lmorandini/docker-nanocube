#
# Dockerfile to build Nanocube and start it with test data
#
FROM ubuntu:15.04

ENV NANOCUBE_VERSION 3.2.1
ENV NANOCUBE_SRC /nanocube-${NANOCUBE_VERSION} 
ENV NANOCUBE_BIN ${NANOCUBE_SRC}/bin
ENV PATH ${NANOCUBE_BIN}:${PATH}
ENV NANOCUBE_PORT 29512
ENV VIEWVER_PORT 8000

RUN apt-get update && apt-get upgrade -yqq

RUN apt-get install -yqq unzip curl build-essential automake \
    libtool zlib1g-dev libboost-all-dev libcurl4-openssl-dev \
    vim

RUN curl -O -J -L -XGET "https://github.com/laurolins/nanocube/archive/${NANOCUBE_VERSION}.zip" \
      -o /nanocube-${NANOCUBE_VERSION}.zip && unzip /nanocube-${NANOCUBE_VERSION}.zip

RUN echo ${NANOCUBE_SRC}
RUN cd ${NANOCUBE_SRC} && ./bootstrap && mkdir build && cd build &&\
     ../configure --prefix=${NANOCUBE_SRC} CXXFLAGS="-O3" &&\
     make && make install

# Starts the NanoCube with a test dataset
COPY startup.sh /startup.sh 
RUN chmod a+x *.sh
ENTRYPOINT "/startup.sh"

EXPOSE ${NANOCUBE_PORT} ${VIEWER_PORT} 