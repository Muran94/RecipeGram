# Dockerfile for development and test environments.

FROM ruby:2.7-alpine

ENV LANG ja_JP.UTF-8
ENV TZ   Asia/Tokyo

WORKDIR /app

COPY Gemfile* ./

RUN apk update && apk upgrade && \
    apk add --update --no-cache build-base bash git less nodejs postgresql-dev tzdata yarn

RUN bundle config set without production && \
    bundle install --jobs=8

RUN yarn install

COPY . .