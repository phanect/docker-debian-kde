FROM debian:jessie

# To avoid download error caused by httpredir.debian.org, using equivalent mirror
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
  && echo "deb http://ftp.jaist.ac.jp/debian/ jessie main" | tee /etc/apt/sources.list \
  && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --yes kde-standard \
  && rm --force /etc/apt/sources.list \
  && mv /etc/apt/sources.list.bak /etc/apt/sources.list \
  && apt-get clean

CMD [ "/bin/bash" ]
