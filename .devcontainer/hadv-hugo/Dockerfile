FROM klakegg/hugo:0.86.1-ext-alpine

LABEL version="20210808"
LABEL description="公式イメージ（klakegg/hugo:0.86.1-ext-alpine）を拡張"

RUN apk --no-cache add docker-cli tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*
COPY asciidoctor /usr/local/bin
