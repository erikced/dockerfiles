FROM docker.io/ubuntu:18.04
EXPOSE 8083
ENV Z_WAY_VERSION 2.3.8
RUN apt-get update \
 && apt-get -y install wget libcurl3 libarchive13 libavahi-compat-libdnssd1 \
 && wget https://storage.z-wave.me/z-way-server/z-way-server-Ubuntu-v${Z_WAY_VERSION}.tgz \
 && tar -xzf z-way-server-Ubuntu-v${Z_WAY_VERSION}.tgz -C /opt \
 && rm z-way-server-Ubuntu-v${Z_WAY_VERSION}.tgz \
 && apt-get -y remove wget
 WORKDIR /opt/z-way-server
 CMD : > /var/log/z-way-server.log; ./z-way-server 1>/dev/null & tail -f /var/log/z-way-server.log --pid $!
