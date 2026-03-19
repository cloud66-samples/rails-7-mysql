FROM ruby:3.2.3-slim

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    default-libmysqlclient-dev \
    default-mysql-client \
    git \
    pkg-config && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test && \
    rm -rf ~/.bundle/cache

COPY . .

RUN SECRET_KEY_BASE=placeholder bundle exec rails assets:precompile

EXPOSE 3000

ENTRYPOINT ["bin/docker-entrypoint"]
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
