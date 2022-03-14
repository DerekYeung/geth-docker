# example of Dockerfile that builds release of electrumx-1.13.0
# ENV variables can be overrided on the `docker run` command

FROM ubuntu:20.04

WORKDIR /
ADD https://github.com/kyuupichan/electrumx/archive/1.19.0.tar.gz /
RUN tar zxvf *.tar.gz

RUN apt-get update && \
  apt-get -y install python3.8 python3-pip librocksdb-dev libsnappy-dev libbz2-dev libz-dev liblz4-dev && \
  pip3 install -r /electrumx*/requirements.txt && pip3 install python-rocksdb

RUN cd /electrumx* && python3 setup.py install

ENV SERVICES="tcp://:50001"
ENV COIN=BitcoinSVTestnet
ENV ALLOW_ROOT=true
ENV DB_ENGINE=rocksdb
ENV MAX_SEND=20000000
ENV BANDWIDTH_UNIT_COST=50000
ENV CACHE_MB=2000

CMD ["/usr/bin/python3", "/usr/local/bin/electrumx_server"]
