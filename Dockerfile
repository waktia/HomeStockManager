FROM ruby:3.2.1
RUN  apt-get update && apt-get install -y \
     build-essential \
     libpq-dev \
     nodejs \
     postgresql-client \
     yarn

RUN gem install bundler -v "2.4.10"

WORKDIR /HomeStockManager
COPY . .
RUN bundle install
