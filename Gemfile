source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.4"

gem "action_policy"
gem "bcrypt", "~> 3.1.7"
gem "enumerize"
gem "interactor"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.7"
gem "sass-rails", ">= 6"
gem "scss_lint"
gem "sidekiq", "<7"
gem "slim_lint"
gem "slim-rails"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"

gem "bootsnap", ">= 1.4.4", require: false
gem "kaminari"
gem "pry", "~> 0.13.1"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails", "~> 6.0.0"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-thread_safety", require: false
end

group :development do
  gem "letter_opener"
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
