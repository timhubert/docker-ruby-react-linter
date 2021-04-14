FROM ruby:2.7-alpine

ENV LANG C.UTF-8

RUN apk update && \
    apk upgrade

RUN apk add --no-cache \
  git \
  bash \
  openssl-dev \
  alpine-sdk \
  cmake \
  g++ \
  nodejs \
  nodejs-npm

RUN npm install -g eslint
RUN npm install eslint-plugin-react

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ENV PATH /usr/src/app:$PATH

RUN gem install pronto

RUN gem install pronto pronto-rubocop pronto-brakeman pronto-fasterer pronto-flay \
  pronto-rails_best_practices pronto-eslint_npm
