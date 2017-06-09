FROM elixir:1.4.4

WORKDIR /app

RUN apt-get update &&\
    apt-get upgrade -y &&\
    mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
RUN . ~/.bashrc && nvm install node

RUN mix local.hex --force

CMD cat ~/.bashrc && . ~/.bashrc 2>&1 /dev/null && npm install && mix phoenix.server
#CMD ~/.nvm/versions/node/v7.10.0/bin/npm install && mix phoenix.server

