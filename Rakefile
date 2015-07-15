# encoding: utf-8

require "rubygems"
require "bundler/setup"

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
task default: "test:coverage:run"

desc "Shows the first evil"
task :mutant do
  system "bundle exec mutant -r faceter --use rspec 'Faceter*' --fail-fast"
end

desc "Shows all evils"
task :exhort do
  system "bundle exec mutant -r faceter --use rspec 'Faceter*'"
end

desc "Runs all the necessary metrics before making a commit"
task prepare: %w(exhort check:inch check:rubocop check:fu)

desc "Compares faceter to rom mapper"
task :benchmark do
  system "ruby benchmark/run.rb"
end
