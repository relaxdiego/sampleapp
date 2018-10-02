FROM ruby:2.4.2-slim-stretch

USER root
WORKDIR /usr/local/bin

RUN gem install sinatra

COPY server.rb .

ENTRYPOINT  ["/usr/local/bin/server.rb"]
