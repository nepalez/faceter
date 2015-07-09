# encoding: utf-8

module Faceter

  module Functions

    # Ungroups array values using provided root key and options
    #
    # @example
    #   fn = Functions[:ungroup, :qux, only: [:bar]]
    #   fn[[{ foo: :FOO, qux: [{ bar: :BAR }, { bar: :BAZ }] }]]
    #   # => [{ foo: :FOO, bar: :BAR }, { foo: :FOO, bar: :BAZ }]
    #
    # @param [Array] array The input array
    # @param [Object] key The nesting root key
    # @param [Hash] options
    #
    # @option (see Faceter::Functions.reverse)
    #
    # @return [Array<Hash>]
    #
    def self.ungroup(array, key, options = {})
      array.flat_map do |hash|
        list = t(:to_tuples)[hash.delete(key)]
        group(list, key, t(:reverse)[options]).map { |item| hash.merge(item) }
      end
    end

  end # module Functions

end # module Faceter
