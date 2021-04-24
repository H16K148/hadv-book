FROM asciidoctor/docker-asciidoctor:1.4.0

LABEL version="20210424"
LABEL description="公式イメージ（asciidoctor/docker-asciidoctor:1.4.0）を拡張"

RUN apk --no-cache add docker-cli git-subtree \
  && gem install --no-document asciidoctor-html5s
RUN ln -s /documents /src
COPY hugo /usr/local/bin
