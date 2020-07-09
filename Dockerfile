FROM ruby:2.7.0

# Install dependencies.
RUN apt-get update -qq && apt-get install -y \
  nodejs

# Copy over the Gemfile so we can install dependencies. We don't copy the entire app, because we'll
# mount it as a volume at runtime.
COPY Gemfile Gemfile.lock /usr/src/lobsters/

# Make the app directory the working directory for subsequent commands.
WORKDIR /usr/src/lobsters

# Install the app's dependencies.
RUN bundle install
