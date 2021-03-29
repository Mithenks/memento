FROM debian:buster-slim

RUN apt-get update && \
    apt-get install --no-install-recommends -y lsb-release vim bash sudo perl-modules git liblwp-protocol-https-perl openssh-client && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN groupadd --gid 1000 memento && \
    useradd \
      --uid 1000 \
      --gid 1000 \
      --groups sudo \
      --create-home \
      --shell /bin/bash \
      memento && \
    echo "memento\nmemento" | passwd memento


COPY ./ /opt/memento

RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential && \
    cpan CPAN && \
    cd /opt/memento && ./install.pl && \
    apt-get remove -y build-essential && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf /root/.cpan
 
USER memento

ARG BUILD_DATE

LABEL maintainer="Michele Mondelli <michele.mondelli@bmeme.com>" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="bmeme/memento" \
      org.label-schema.version="dev" \
      org.label-schema.description="Memento docker image" \
      org.label-schema.url="https://www.bmeme.com/"
