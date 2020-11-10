FROM ruby:2.7.2-alpine AS base

RUN apk add --update postgresql-dev tzdata build-base nodejs npm

RUN npm install -g yarn

WORKDIR /usr/src/app

RUN mkdir -p /usr/src/app

FROM base AS dev

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

ENV PATH="${BUNDLE_BIN}:${PATH}"

FROM base AS build

RUN gem install bundler

ADD Gemfile* ./

RUN bundle config --global frozen 1 \
  && bundle config set without 'development test' \
  && bundle install -j4 --retry 3 \
  && rm -rf /usr/local/bundle/cache/*.gem \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete

COPY . .

RUN bundle exec rake assets:precompile

RUN rm -rf node_modules tmp/cache vendor/assets lib/assets spec

FROM base AS prod

RUN apk add postgresql-client tzdata

RUN mkdir log

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /usr/src/app /usr/src/app

ENV RAILS_SERVE_STATIC_FILES=true

CMD ["entrypoint.sh"]
