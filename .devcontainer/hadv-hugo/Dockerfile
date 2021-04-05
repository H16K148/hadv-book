FROM klakegg/hugo:0.82.0-ext-alpine

LABEL version="20210404"
LABEL description="公式イメージ（klakegg/hugo:0.82.0-ext-alpine）を拡張"

RUN apk --no-cache add docker-cli
COPY .devcontainer/hadv-hugo/asciidoctor /usr/local/bin
