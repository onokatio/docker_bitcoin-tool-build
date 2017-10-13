# docker_bitcoin-tool-build

[![Docker Stars](https://img.shields.io/docker/stars/onokatio/docker_bitcoin-tool-build.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/onokatio/docker_bitcoin-tool-build.svg)]()
[![Docker Pulls](https://img.shields.io/docker/automated/onokatio/docker_bitcoin-tool-build.svg)]()
[![Docker Pulls](https://img.shields.io/docker/build/onokatio/docker_bitcoin-tool-build.svg)]()

bitcoind, bitcoin-cli, bitcoin-tx, bitcoin-qt, libbitcoinなど、bitcoinのインテグレーションツリーに入っているものを全てビルドするDockerfileです。
ビルド済みのものはdockerhubに上がっています。

https://hub.docker.com/r/onokatio/docker_bitcoin-tool-build/

# How to use

## To build

```
$ docker build -t bitcoin-tool-build .
```

## To use only getting binary

```
$ docker pull onokatio/docker_bitcoin-tool-build
$ docker run -it onokatio/docker_bitcoin-tool-build
```
