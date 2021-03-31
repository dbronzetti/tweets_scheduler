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
RUN bundle install
EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
