FROM ubuntu:bionic
LABEL maintainer "jc@phocean.net"

RUN apt-get update \
  && apt-get install -y git python python-distorm3 python-crypto \
  && adduser --disabled-login --system --no-create-home vol \
  && git clone https://github.com/volatilityfoundation/volatility.git \
  && chown -R vol /volatility \
  && rm -rf /volatility/.git \
  && apt-get -y remove --purge git \
  && apt-get -y autoremove \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*
  
VOLUME /dumps

USER vol

WORKDIR /volatility

ENTRYPOINT ["python", "vol.py"]
