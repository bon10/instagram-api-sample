FROM ruby:2.4.2

ENV LANG C.UTF-8

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs \
    && rm -rf /var/lib/apt/lists/*

ENV APP_ROOT /app
WORKDIR $APP_ROOT

RUN gem install bundler

CMD ["bash"]
