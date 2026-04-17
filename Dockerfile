FROM ruby:2.6.10

RUN apt-get update \
        && apt-get install -y --no-install-recommends postgresql-client \
        && rm -rf /var/lib/apt/lists/*

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install 24

WORKDIR /usr/src/app

COPY Gemfile* ./
RUN bundle install
