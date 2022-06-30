FROM asciidoctor/docker-asciidoctor:1.14

LABEL version="20211206"
LABEL description="公式イメージ（asciidoctor/docker-asciidoctor:1.14）を拡張"

RUN apk --no-cache add openssh docker-cli git-subtree \
  && gem install --no-document asciidoctor-html5s
RUN ln -s /documents /src
COPY hugo /usr/local/bin

# CodeCommit などで git で使用する秘密鍵などを設置する
#COPY entrypoint.sh /
#ENTRYPOINT [ "sh", "/entrypoint.sh" ]
