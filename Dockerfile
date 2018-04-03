FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /vulnerable_rails
WORKDIR /vulnerable_rails
COPY Gemfile /vulnerable_rails/Gemfile
COPY Gemfile.lock /vulnerable_rails/Gemfile.lock
RUN bundle install
COPY . /vulnerable_rails
