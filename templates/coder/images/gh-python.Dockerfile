FROM ghcr.io/hxrsmurf/docker-code-server:python

RUN sudo apt-get update && sudo apt-get upgrade -yf

USER coder