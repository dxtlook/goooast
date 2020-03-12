FROM alpine:3.6

ENV VER=2.11.0 METHOD=aes-128-cfb PASSWORD=ss123456
ENV TLS_PORT=4433 PORT=8080

#RUN apk add --no-cache curl \
#  && curl -sL https://github.com/xiaokaixuan/gost-heroku/releases/download/v${VER}/gost_${VER}_linux_amd64.tar.gz | tar zx \
#  && mv gost_${VER}_linux_amd64 gost && chmod a+x gost/gost

RUN mkdir -m 777 /gost
RUN wget -O gost.gz http://github.com/ginuerzh/gost/releases/download/v${VER}/gost-linux-amd64-${VER}.gz \
  && gunzip -c gost.gz > /gost/gost && chmod a+x gost/gost

WORKDIR /gost
EXPOSE ${TLS_PORT} $PORT

CMD exec /gost/gost -L=tls://:${TLS_PORT}/:$PORT -L=ss+mws://$METHOD:$PASSWORD@:$PORT
#CMD exec /gost -L=tls://:${TLS_PORT}/:$PORT -L=ss+mws://$METHOD:$PASSWORD@:$PORT


# Dockerfile 方式
#FROM alpine:3.6
#ENV VER=2.5
#ENV METHOD=chacha20
#ENV PASSWORD=ss123456
#ENV PORT=8100
#RUN apk add --no-cache curl \
#  && curl -sL https://github.com/xiaokaixuan/gost-heroku/releases/download/v$VER/gost_${VER}_linux_amd64.tar.gz | tar zx \
#  && chmod +x gost_${VER}_linux_amd64/gost
#CMD /gost_${VER}_linux_amd64/gost -L=ss+mws://$METHOD:$PASSWORD@:$PORT


## entrypoint.sh 方式
# FROM heroku/heroku:18
# RUN mkdir -m 777 /gost
 
#ADD entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh 
#CMD /entrypoint.sh
