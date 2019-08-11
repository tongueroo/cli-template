source 'https://rubygems.org'

# Specify your gem's dependencies in cli-template.gemspec
gemspec

# Some gems are included because the generated project contains these gems
# We use bundle exec to run specs in circleci.
# This workaround ensures those gems are also installed with the first bundle install.
group :test do
  gem "codeclimate-test-reporter", require: nil
  gem "cli_markdown"
end