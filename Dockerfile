FROM alpine/bundle

COPY . ./

RUN bundle install

RUN rails test
