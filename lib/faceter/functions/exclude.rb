# encoding: utf-8

module Faceter

  module Functions

    # Excludes keys, that satisfies the selector, from the hash
    #
    # @example
    #   selector = Selector.new(only: /b/)
    #   function = Functions[:exclude, selector]
    #
    #   function[{ foo: :FOO, bar: :BAR, baz: :BAZ }]
    #   # => { foo: :FOO }
    #
    # @param [Hash] hash
    # @param [Selector::Condition] selector
    #
    # @return [Array<Hash>]
    #
    def self.exclude(hash, selector)
      hash.reject { |key| selector[key] }
    end

  end # module Functions

end # module Faceter
