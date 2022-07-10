FROM ruby:3.0-alpine
RUN apk update && apk add --virtual build-dependencies build-base

RUN gem install sinatra
RUN gem install sinatra-contrib
RUN gem install puma

#COPY sample.rb .
#COPY Gemfile .
#COPY Gemfile.lock .
#EXPOSE 4567

#CMD ["ruby", "sample.rb"]