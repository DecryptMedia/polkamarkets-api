FROM ruby:3.0.3
WORKDIR /app

RUN apt-get update && apt-get install -y libsodium-dev && \
    rm -rf /var/lib/apt/lists/* && \
    gem install bundler:2.3.11

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 4000

ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "s", "-b", "0.0.0.0", "-e", "production"]
