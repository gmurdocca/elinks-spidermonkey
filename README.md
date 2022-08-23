# ELinks + Seamonkey

This dockerfile produces the latest ELinks text browser binary with SSL and ECMAScript support.

Build:
```
docker build -f Dockerfile . -t elinks-seamonkey
```
Run:
```
docker run -it elinks-seamonkey elinks
```
Image available on Docker Hub here: https://hub.docker.com/r/linuxdojo/elinks-seamonkey
