FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    git=1:2.33.0-1ubuntu1 \
    git-svn \
    subversion \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
