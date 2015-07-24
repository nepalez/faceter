# encoding: utf-8

module Faceter

  module Functions

    # Symbolizes selected keys in a hash
    #
    # @example
    #   function = Functions[:symbolize_keys, selector]
    #
    #   function[{ "foo" => :FOO, "bar" => :BAR }]
    #   # => { foo: :FOO, bar: :BAR }
    #
    # @param [Hash, Array] hash
    #
    # @return [Hash, Array]
    #
    def self.symbolize_keys(hash)
      Hash[hash.keys.map { |key| key.to_s.to_sym }.zip(hash.values)]
    end

  end # module Functions

end # module Faceter
