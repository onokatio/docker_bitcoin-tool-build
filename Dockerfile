FROM alpine:edge

ENV gpp_version 6.4.0-r5
ENV bitcoin_version v0.15.0.1
ENV bitcoin_archive_url https://github.com/bitcoin/bitcoin/archive/${bitcoin_version}.tar.gz
ENV depend_packages "git autoconf automake libtool g++=${gpp_version} make boost-d    ev libressl-dev db-dev miniupnpc-dev qt5-qtbase-dev qt5-qttools-dev protobuf-dev libqrencode-    dev libevent-dev chrpath"
ENV make_worker 3

RUN apk --no-cache --update add ${depend_packages} \
# && git clone -b v0.15.0.1 --depth 1 https://github.com/bitcoin/bitcoin /bitcoin-src \
&& mkdir /bitcoin-build \
&& wget "${bitcoin_archive_url}" -O /bitcoin.tar.gz \
&& tar xvf /bitcoin.tar.gz -C /bitcoin-build --strip-components 1 \
&& cd /bitcoin-build \
&& ./autogen.sh \
&& ./configure --with-incompatible-bdb --with-gui=qt5 --with-utils --disable-ccache --disable-static --enable-hardening \
#&& make --jobs="${make_worker}" \
&& make -j \
&& make check

CMD ["sh"]
