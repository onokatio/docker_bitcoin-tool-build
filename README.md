# docker_bitcoin-tool-build

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
