FROM ruby:2.3.7

MAINTAINER Quentin Rousseau <contact@quent.in>

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  build-essential nodejs libpq-dev

ENV INSTALL_PATH /app

ENV RAILS_ENV production

ENV PGBOUNCER_DATABASE_URL postgresql://user:pass@127.0.0.1/dbname

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./

RUN bundle install --binstubs

COPY . .

RUN bundle exec rake assets:precompile

ENV PORT 8080

EXPOSE 8080

CMD unicorn -p 8080 -c ./config/unicorn.rb -E production
