# node-docker-compose-sample
Samples for creating web-project environment with Node.js, docker, docker-compose

## Virtualized cluster installation (OS X)

Sample is OS X based, but common idea is clear.

### Install docker with all tools

```bash
$ brew update
$ brew install virtualbox docker docker-machine docker-compose
```

### Configure docker

Create virtual machive with docker and pass all variables to your environment. `dev` will be a name for VM instance
```bash
$ docker-machine create --driver virtualbox dev
$ eval $(docker-machine env dev)
```

### Run cluster

```bash
$ docker-compose up
```
All published ports (`3000` and `3000`) will be forwarded to `dev` VM ip.

### Check server is running

```bash
$ curl "$(docker-machine ip dev):3000/set/value"
$ curl "$(docker-machine ip dev):3000/"
```
