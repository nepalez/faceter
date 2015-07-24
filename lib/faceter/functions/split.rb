# encoding: utf-8

module Faceter

  module Functions

    # Splits the hash into two parts using a selector
    #
    # @example
    #   selector = Selector.new(except: /r/)
    #   function = Functions[:split, selector]
    #
    #   function[{ foo: :FOO, bar: :BAR, baz: :BAZ }]
    #   # => [{ foo: :FOO, baz: :BAZ }, { bar: :BAR }]
    #
    # @param [Hash] hash
    # @param [Selector::Condition] selector
    #
    # @return [Array<Hash>]
    #
    def self.split(hash, selector)
      fn = -> key, _ { selector[key] }
      [hash.select(&fn), hash.reject(&fn)]
    end

  end # module Functions

end # module Faceter
