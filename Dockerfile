FROM ruby:2.7.1-buster

RUN apt-get update -qq \
    && apt-get install -y nodejs \
      postgresql-client \
      yarn \
      vim \
    && apt-get clean

WORKDIR /app
COPY . /app

ENV BUNDLE_PATH /gems
# This will update yarn to the las stable version and allow webpacker to be installed correctly
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install yarn
RUN bundle install
EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
