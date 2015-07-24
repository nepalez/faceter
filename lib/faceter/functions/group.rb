# encoding: utf-8

module Faceter

  module Functions

    # Groups array values using provided root key and selector
    #
    # @example
    #   selector = Selector.new(only: [:bar])
    #   function = Functions[:group, :qux, selector]
    #
    #   function[[{ foo: :FOO, bar: :BAR }, { foo: :FOO, bar: :BAZ }]]
    #   # => [{ foo: :FOO, qux: [{ bar: :BAR }, { bar: :BAZ }] }]
    #
    # @param [Array] array
    # @param [Object] key
    # @param [Selector::Condition] selector
    #
    # @return [Array<Hash>]
    #
    def self.group(array, key, selector)
      tuples = Hash.new { |h, k| h[k] = [] }

      array.each do |hash|
        to_group, to_keep = split(Hash[hash], selector)
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
