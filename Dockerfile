FROM debian:stretch

# To avoid download error caused by httpredir.debian.org, using equivalent mirror
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --yes tasksel \
  && DEBIAN_FRONTEND=noninteractive tasksel install desktop kde-desktop \
  && rm --force /etc/apt/sources.list \
  && mv /etc/apt/sources.list.bak /etc/apt/sources.list \
  && apt-get clean

CMD [ "/bin/bash" ]
