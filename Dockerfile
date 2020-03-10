FROM ubuntu:18.04

MAINTAINER TimW <pm3docker@secopsconsulting.com> 

WORKDIR /opt

#ADD file:9a7009973b  /  
RUN set -xe   && echo '#!/bin/sh' > /usr/sbin/policy-rc.d  && echo 'exit 101' >> /usr/sbin/policy-rc.d  && chmod +x /usr/sbin/policy-rc.d   && dpkg-divert --local --rename --add /sbin/initctl  && cp -a /usr/sbin/policy-rc.d /sbin/initctl  && sed -i 's/^exit.*/exit 0/' /sbin/initctl   && echo 'force-unsafe-io' > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup   && echo 'DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' > /etc/apt/apt.conf.d/docker-clean  && echo 'APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' >> /etc/apt/apt.conf.d/docker-clean  && echo 'Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";' >> /etc/apt/apt.conf.d/docker-clean   && echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/docker-no-languages   && echo 'Acquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/docker-gzip-indexes

RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
RUN rm -rf /var/lib/apt/lists/*   
RUN apt-get clean &&  \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git build-essential libreadline5 libreadline-dev \
                    libncurses5-dev libusb-0.1-4 libusb-dev libqt4-dev perl \
                    pkg-config wget gcc-arm-none-eabi usbutils nano  

RUN git clone --depth=1 https://github.com/RfidResearchGroup/proxmark3.git && cd proxmark3 && make all

ENV HOME=/opt/proxmark3   
WORKDIR /opt/proxmark3

COPY 77-mm-usb-device-blacklist.rules /etc/udev/rules.d/
COPY start.sh /opt/proxmark3/
chmod u+x $HOME/start.sh


CMD ["/bin/bash"] 
