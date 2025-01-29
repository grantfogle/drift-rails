# Use the official Ruby image as a parent image
FROM ruby:3.1.3

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    sqlite3 \
    libsqlite3-dev

# Install yarn
RUN npm install -g yarn

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application
COPY . .

# Add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Add environment variable for SQLite
ENV DATABASE_URL="sqlite3:db/development.sqlite3"

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
