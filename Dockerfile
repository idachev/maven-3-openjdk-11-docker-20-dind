FROM maven:3-openjdk-11

RUN apt-get update

RUN apt-get install -y -q \
    ca-certificates \
    curl \
    gnupg \
    apt-utils \
    lsb-release

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
    https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN echo "debconf debconf/frontend select Noninteractive" | debconf-set-selections

RUN apt-get update

RUN apt-get install -y -q docker-ce-cli

RUN apt-get clean
