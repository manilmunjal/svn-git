FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    git \
    git-svn \
    subversion \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
