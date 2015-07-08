# encoding: utf-8

module Faceter

  module Functions

    # Removes selected keys from hash if they values are empty
    #
    # @example
    #   fn = Functions[:clean, [:foo, :bar]]
    #   fn[foo: { foo: :FOO }, bar: {}, baz: {}]
    #   # => { foo: { foo: :FOO }, baz: {} }
    #
    # @param [Hash] hash
    # @param [Array] keys
    #
    # @return [Hash]
    #
    def self.clean(hash, *keys)
      names = keys.flatten
      hash.reject { |key, value| names.include?(key) && value.empty? }
    end

  end # module Functions

end # module Faceter
