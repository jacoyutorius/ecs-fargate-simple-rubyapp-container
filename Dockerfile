FROM ruby:2.6.5-alpine3.10

WORKDIR /app

COPY Gemfile Gemfile.lock app.rb ./
RUN bundle install

CMD ["ruby", "./app.rb"]