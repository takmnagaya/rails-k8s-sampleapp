FROM ruby:2.6-alpine
ENV LANG C.UTF-8

RUN apk update && \
    apk add --update build-base \
        mysql-dev \
        nodejs \
        tzdata

WORKDIR /app
COPY Gemfile* /app/
RUN bundle install --clean -j20

COPY . /app/
CMD ["bundle", "exec", "rails", "s"]
