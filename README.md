# ELinks + Seamonkey

This dockerfile produces the latest ELinks text browser binary with SSL and ECMAScript support.

Credit to Jean-Luc Aufranc for the manual [build process details](https://www.cnx-software.com/2014/02/09/building-elinks-text-based-web-browser-with-some-sort-of-javascript-support/).

Build:
```
docker build -f Dockerfile . -t elinks-seamonkey
```
Run:
```
docker run -it elinks-seamonkey elinks
```
Image available on Docker Hub here: https://hub.docker.com/r/linuxdojo/elinks-seamonkey
