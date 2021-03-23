FROM ubuntu:18.04

#REMEMBER USE LF

RUN apt-get update && apt-get install nano unzip -y \ 
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY terraria-server-1412.zip /root
RUN cd ./root/ \
    && unzip terraria-server-1412.zip \
    && cd 1412/Linux \
    && chmod u+x TerrariaServer* \
    && rm -r /root/terraria-server-1412.zip

ADD startserver.sh ./root/1412/Linux/startserver.sh
RUN cp ./root/1412/Windows/serverconfig.txt ./root/1412/Linux/serverconfig.txt \
    && cd ./root/1412/Linux/ && chmod +x startserver.sh

WORKDIR ./root/1412/Linux
EXPOSE 7777

ENTRYPOINT ["sh","./startserver.sh"]