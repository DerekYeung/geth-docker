FROM golang:1.13.4-alpine as BUILDER
ARG VERSION=v1.9.7
ENV GO111MODULE=off
RUN apk add --no-cache make gcc musl-dev linux-headers git ca-certificates
WORKDIR /
RUN git clone --quiet --branch ${VERSION} --depth 1 https://github.com/ethereum/go-ethereum geth
RUN cd geth && make geth

FROM alpine:3.10
RUN addgroup -g 1000 geth && adduser -u 1000 -G geth -s /bin/sh -D geth
COPY --from=BUILDER /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=BUILDER /geth/build/bin/geth /usr/local/bin/
EXPOSE 8545 8546 30303 30303/udp
USER geth
WORKDIR /home/geth
STOPSIGNAL SIGINT
VOLUME [ "/home/geth/.ethereum" ]
ENTRYPOINT ["/usr/local/bin/geth"]
