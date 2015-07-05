# encoding: utf-8
begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
  exit
end

# Loads bundler tasks
Bundler::GemHelper.install_tasks

# Loads the Hexx::RSpec and its tasks
begin
  require "hexx-suit"
  Hexx::Suit.install_tasks
rescue LoadError
  require "hexx-rspec"
  Hexx::RSpec.install_tasks
end

# Sets the Hexx::RSpec :test task to default
task :default do
  system "bundle exec rspec spec"
end

desc "Looks for the first unkilled evil"
task :mutant do
  system "mutant -r ./spec/spec_helper --use rspec 'Faceter*' --fail-fast"
end

desc "Finds out all existing evils"
task :exhort do
  system "mutant -r ./spec/spec_helper --use rspec 'Faceter*'"
end

desc "Runs all the necessary metrics before making a commit"
task prepare: %w(exhort check:inch check:rubocop check:fu)
