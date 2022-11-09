FROM ruby:3.0.3

RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

ENV DATABASE_HOST=db
ENV DATABASE_USERNAME=postgres
ENV DATABASE_PASSWORD=password

RUN mkdir /app
WORKDIR /app

EXPOSE 3000

COPY Gemfile .
COPY Gemfile.lock .
RUN gem update bundler
RUN bundle install

COPY package.json .
COPY yarn.lock .
RUN yarn install

RUN rails assets:precompile

CMD rails server -b 0.0.0.0