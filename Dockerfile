FROM alpine:3.6

ENV VER=2.11.1 METHOD=aes-256-gcm PASSWORD=32425150
ENV TLS_PORT=443 PORT=80

RUN apk add --no-cache curl \
  && curl -sL https://github.com/xiaokaixuan/gost-heroku/releases/download/v${VER}/gost_${VER}_linux_amd64.tar.gz | tar zx \
  && mv gost_${VER}_linux_amd64 gost && chmod a+x gost/gost

WORKDIR /gost
EXPOSE ${TLS_PORT} $PORT

CMD exec /gost/gost -L=ss+wss://$METHOD:$PASSWORD@:$TLS_PORT -L=ss+ws://$METHOD:$PASSWORD@:$PORT

