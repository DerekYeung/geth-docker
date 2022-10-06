FROM buildpack-deps:jessie-curl
COPY geth_linux /usr/local/bin/geth
RUN chmod +x /usr/local/bin/geth
EXPOSE 7891 7892 30303 30303/udp
WORKDIR /data
ENTRYPOINT ["geth"]