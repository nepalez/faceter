# encoding: utf-8

begin
  require "hexx-suit"
  Hexx::Suit.load_metrics_for(self)
rescue LoadError
  require "hexx-rspec"
  Hexx::RSpec.load_metrics_for(self)
end

# Loads the code under test
require "faceter"

# Loads shared examples
require "abstract_mapper/rspec"
require "transproc/rspec"

# Creates the temporary Test module for test-specific constants
RSpec.configure do |config|
  config.around do |example|
    class Faceter::Test; end
    example.run
    Faceter.send :remove_const, :Test
  end
end
