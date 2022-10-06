FROM buildpack-deps:jessie-curl
RUN wget -P /usr/local/bin/ https://github.com/binance-chain/bsc/releases/download/v1.1.14/geth_linux && mv /usr/local/bin/geth_linux /usr/local/bin/geth && chmod +x /usr/local/bin/geth
EXPOSE 7891 7892 30303 30303/udp
WORKDIR /data
ENTRYPOINT ["geth"]