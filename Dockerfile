#Run this with "--user $(id -u):$(id -g" if you want to run as the current user

FROM starefossen/ruby-node:2-10-slim
RUN apt-get update -qq && \
    apt-get install -y vim build-essential libpq-dev && \
    gem install bundler
RUN mkdir /project
COPY Gemfile Gemfile.lock /project/
WORKDIR /project
#Note that grabbing dependencies and transfering the Gemfile and Gemfile.lock before running "bundle install" will lead to faster builds
RUN bundle install
COPY . /project

