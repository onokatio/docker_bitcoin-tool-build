FROM alpine:edge

RUN apk --no-cache --update add git autoconf automake libtool g++=6.4.0-r5 pkgconf make boost-dev libressl-dev libevent-dev qt5-qttools qt5-qttools-dev qt5-qtbase qt5-qtbase-dev
	RUN git clone -b v0.15.0.1 --depth 1 https://github.com/bitcoin/bitcoin /bitcoin-src \
	&& cd /bitcoin-src \
	&& BITCOIN_ROOT=$(pwd) \
	&& BDB_PREFIX=${BITCOIN_ROOT}/db-build \
	&& mkdir -p $BDB_PREFIX \
	&& wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz \
	&& echo '12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz' | sha256sum -c \
	&& tar -xzvf db-4.8.30.NC.tar.gz \
	&& cd db-4.8.30.NC/build_unix/
	RUN cd /bitcoin-src \
	&& BITCOIN_ROOT=$(pwd) \
	&& BDB_PREFIX=${BITCOIN_ROOT}/db-build \
	&& cd db-4.8.30.NC/build_unix/ \
	&& ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$BDB_PREFIX
	RUN cd /bitcoin-src \
	&& BITCOIN_ROOT=$(pwd) \
	&& BDB_PREFIX=${BITCOIN_ROOT}/db-build \
	&& cd db-4.8.30.NC/build_unix/ \
	&& make install
	RUN cd /bitcoin-src \
	&& BITCOIN_ROOT=$(pwd) \
	&& BDB_PREFIX=${BITCOIN_ROOT}/db-build \
	&& ./autogen.sh \
	&& ./configure LDFLAGS="-L${BDB_PREFIX}/lib/" CPPFLAGS="-I${BDB_PREFIX}/include/" \
	&& make -j4

CMD ["sh"]
