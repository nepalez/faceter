# encoding: utf-8

module Faceter

  module Functions

    # Stringifies all keys in a hash
    #
    # @example
    #   function = Functions[:stringify_keys]
    #
    #   function[{ foo: :FOO, bar: :BAR }]
    #   # => { "foo" => :FOO, "bar" => :BAR }
    #
    # @param [Hash, Array] hash
    #
    # @return [Hash, Array]
    #
    def self.stringify_keys(hash)
      Hash[hash.keys.map(&:to_s).zip(hash.values)]
    end

  end # module Functions

end # module Faceter
