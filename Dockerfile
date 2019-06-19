FROM ubuntu:18.04

MAINTAINER <christoph.hahn@uni-graz.at>

RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential git python3 python3-pip python3-dev 

WORKDIR /usr/src

RUN git clone --recursive https://github.com/rrwick/Porechop.git && \
	cd Porechop && \
	git reset --soft 109e437280436d1ec27e5a5b7a34ffb752176390 && \
	cd porechop && \
	mv adapters.py adapters_original.py && \
	ln -s adapters_original.py adapters.py && \
	cd .. && \
	make

#USER root
ADD ./porechop.custom /usr/bin/
RUN chmod a+x /usr/bin/porechop.custom
RUN ln -s /usr/src/Porechop/porechop-runner.py /usr/bin/porechop && \
	chmod a+x /usr/bin/porechop.custom
RUN chmod -R a+w /usr/src/Porechop

RUN adduser --disabled-password --gecos '' porechopuser
USER porechopuser
