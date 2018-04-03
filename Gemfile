source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'puma', '~> 3.7'

group :development, :test do
  gem 'sqlite3', '~> 1.3'
end


group :production do
  gem 'mysql2', '~> 0.4.9'
end
