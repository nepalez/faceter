# encoding: utf-8

module Faceter

  module Functions

    # Partially wraps a subhash into the new key following the selector
    #
    # @example
    #   selector = Selector.new(only: :bar)
    #   function = Functions[:wrap, :foo, selector]
    #
    #   function[foo: { baz: :BAZ }, bar: :BAR, qux: :QUX]
    #   # => { foo: { baz: :BAZ, bar: :BAR }, qux: :QUX }
    #
    # @param [Hash] hash
    # @param [Object] key
    # @param [Selector::Condition] selector
    #
    # @return Hash
    #
    def self.wrap(hash, key, selector)
      to_wrap, to_keep = split(hash, selector)
      wrapped = to_keep[key]

      to_wrap = wrapped.merge(to_wrap) if wrapped.instance_of? Hash
      to_keep.merge(key => to_wrap)
    end

  end # module Functions

end # module Faceter
