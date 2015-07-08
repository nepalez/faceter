# encoding: utf-8

module Faceter

  module Functions

    import :to_tuples, from: Transproc::Coercions

    # Groups array values using provided root key and options
    #
    # @example
    #   fn = Functions[:group, :qux, only: [:bar]]
    #   fn[[{ foo: :FOO, bar: :BAR }, { foo: :FOO, bar: :BAZ }]]
    #   # => [{ foo: :FOO, qux: [{ bar: :BAR }, { bar: :BAZ }] }]
    #
    # @param [Array] array The input array
    # @param [Object] key The nesting root key
    # @param [Hash] options
    #
    # @option (see Faceter::Functions.reverse)
    #
    # @return [Array<Hash>]
    #
    def self.group(array, key, options)
      tuples = Hash.new { |h, k| h[k] = [] }

      array.each do |hash|
        to_group, to_keep = split(Hash[hash], options)
        grouped = t(:to_tuples)[to_keep[key]]
        to_keep.delete(key)

        tuples[to_keep] << grouped.map { |item| item.merge(to_group) }
      end

      tuples.map do |root, children|
        list = children.flatten
        list.first.empty? ? root : root.merge(key => list)
      end
    end

  end # module Functions

end # module Faceter
