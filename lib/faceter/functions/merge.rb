# encoding: utf-8

module Faceter

  module Functions

    # Applies proc to the source and merges the result to it
    #
    # If key is given, treats the source as hash and merges the result of proc
    # to the hash under given key. Otherwise returns the result of the proc.
    #
    # @example
    #   proc = -> value { :BAZ }
    #   source = { foo: :FOO }
    #
    #   fn = Functions[:merge, proc, :foo]
    #   fn[source] # => { foo: :BAZ }
    #
    #   fn = Functions[:merge, proc, :bar]
    #   fn[source] # => { foo: :FOO, bar: :BAZ }
    #
    #   fn = Functions[:merge, proc]
    #   fn[source] # => :BAZ
    #
    # @overload merge(source, proc, key)
    #
    #   @param [Hash] source
    #   @param [Proc] proc
    #   @param [Object] key
    #
    #   @return [Hash] The source with merged result of the proc
    #
    # @overload merge(source, proc)
    #
    #   @param [Object] source
    #   @param [Proc] proc
    #
    #   @return [Object] The result of the proc
    #
    def self.merge(source, proc, key = nil)
      value = proc.call(source)
      key ? source.merge(key => value) : value
    end

  end # module Functions

end # module Faceter
