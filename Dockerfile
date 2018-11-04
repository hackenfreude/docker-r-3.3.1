FROM debian:stretch-20181011

RUN apt-get update && apt-get install --assume-yes --no-install-recommends \
	r-base

COPY Rprofile.site /etc/R/

ENTRYPOINT ["R"]

