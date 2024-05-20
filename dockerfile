# Use an official Ubuntu as a base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        subversion \
        git \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

# Install svn2git from GitHub
RUN git clone https://github.com/nirvdrum/svn2git.git \
    && cd svn2git \
    && make install

# Set the working directory
WORKDIR /workspace

# Default command
CMD ["bash"]
