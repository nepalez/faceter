# encoding: utf-8

module Faceter

  module Functions

    # Removes selected keys from hash if they values are empty
    #
    # @example
    #   selector = Selector.new(only: /b/)
    #   function = Functions[:clean, selector]
    #
    #   function[foo: {}, bar: {}, baz: :BAZ]
    #   # => { foo: {}, baz: :BAZ }
    #
    # @param [Hash] hash
    # @param [Selector::Condition] selector
    #
    # @return [Hash]
    #
    def self.clean(hash, selector)
      hash.reject { |key, value| selector[key] && value.empty? }
    end

  end # module Functions

end # module Faceter
