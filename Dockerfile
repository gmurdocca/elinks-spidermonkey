FROM mchawre/ubuntu-12.04

# fix apt
RUN rm -f /etc/apt/sources.list.d/proposed.list
RUN rm -f /etc/apt/sources.list
RUN echo 'deb http://old-releases.ubuntu.com/ubuntu/ precise main restricted\n\
deb-src http://old-releases.ubuntu.com/ubuntu/ precise main restricted\n\
deb http://old-releases.ubuntu.com/ubuntu/ precise-updates main restricted\n\
deb-src http://old-releases.ubuntu.com/ubuntu/ precise-updates main restricted\n\
deb http://old-releases.ubuntu.com/ubuntu/ precise universe\n\
deb-src http://old-releases.ubuntu.com/ubuntu/ precise universe\n\
deb http://old-releases.ubuntu.com/ubuntu/ precise-updates universe\n\
deb-src http://old-releases.ubuntu.com/ubuntu/ precise-updates universe\n\
deb http://old-releases.ubuntu.com/ubuntu/ precise multiverse\n\
deb-src http://old-releases.ubuntu.com/ubuntu/ precise multiverse\n\
deb http://old-releases.ubuntu.com/ubuntu/ precise-updates multiverse\n\
deb-src http://old-releases.ubuntu.com/ubuntu/ precise-updates multiverse\n\
deb http://old-releases.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse\n\
deb-src http://old-releases.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse\n\
deb http://old-releases.ubuntu.com/ubuntu precise-security main restricted\n\
deb-src http://old-releases.ubuntu.com/ubuntu precise-security main restricted\n\
deb http://old-releases.ubuntu.com/ubuntu precise-security universe\n\
deb-src http://old-releases.ubuntu.com/ubuntu precise-security universe\n\
deb http://old-releases.ubuntu.com/ubuntu precise-security multiverse\n\
deb-src http://old-releases.ubuntu.com/ubuntu precise-security multiverse\n\
' > /etc/apt/sources.list

RUN apt-get update

# install deps
RUN apt-get -y install libmozjs185-dev pkg-config wget bzip2 libssl-dev
RUN apt-get -y install build-essential

# build elinks
RUN cd /tmp && \
    wget http://elinks.or.cz/download/elinks-current-0.13.tar.bz2 && \
    tar xjvf elinks-current-0.13.tar.bz2 && \
    cd elinks-0.13* && \
    ./configure && \
    make -j8 && \
    make install

# configure ELinks
RUN mkdir -p /root/.elinks
RUN echo 'set ecmascript.enable = 1\n\
set document.browse.forms.confirm_submit = 0\n\
set connection.ssl.cert_verify = 0\n\
' > /root/.elinks/elinks.conf

# update root certs
RUN sed -i '/DST_Root_CA_X3.crt/d' /etc/ca-certificates.conf
RUN update-ca-certificates
