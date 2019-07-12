# Dockerfile 方式
#FROM alpine:3.6
#FROM alpine:latest
#ENV VER=2.5
#ENV METHOD=chacha20
#ENV PASSWORD=ss123456
#ENV PORT=8100
#RUN apk add --no-cache curl \
#  && curl -sL https://github.com/xiaokaixuan/gost-heroku/releases/download/v$VER/gost_${VER}_linux_amd64.tar.gz | tar zx \
#  && chmod +x gost_${VER}_linux_amd64/gost
#CMD /gost_${VER}_linux_amd64/gost -L=ss+mws://$METHOD:$PASSWORD@:$PORT


# entrypoint.sh 方式
FROM heroku/heroku:18
RUN mkdir -m 777 /gost
 
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 

CMD /entrypoint.sh