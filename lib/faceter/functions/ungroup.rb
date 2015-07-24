# encoding: utf-8

module Faceter

  module Functions

    # Ungroups array values using provided root key and selector
    #
    # @example
    #   selector = Selector.new(only: :bar)
    #   function = Functions[:ungroup, :qux, selector]
    #
    #   function[[{ foo: :FOO, qux: [{ bar: :BAR }, { bar: :BAZ }] }]]
    #   # => [{ foo: :FOO, bar: :BAR }, { foo: :FOO, bar: :BAZ }]
    #
    # @param [Array] array
    # @param [Object] key
    # @param [Selector::Condition] selector
    #
    # @return [Array<Hash>]
    #
    def self.ungroup(array, key, selector)
      array.flat_map do |hash|
        list = t(:to_tuples)[hash.delete(key)]
        group(list, key, !selector).map { |item| hash.merge(item) }
      end
    end

  end # module Functions

end # module Faceter
