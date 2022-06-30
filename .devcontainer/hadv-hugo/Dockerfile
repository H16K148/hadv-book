FROM klakegg/hugo:0.89.4-ext-alpine

LABEL version="20211206"
LABEL description="公式イメージ（klakegg/hugo:0.89.4-ext-alpine）を拡張"

RUN apk --no-cache add docker-cli tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*
COPY asciidoctor /usr/local/bin
