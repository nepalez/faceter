# encoding: utf-8

module Faceter

  module Functions

    # Execute the function with value, or its subvalues under given keys
    #
    # @overload execute(value, fn)
    #   Executes a function with given value
    #
    #   @example
    #     fn = Functions[:execute, -> v { v.reverse }]
    #     fn["foo"] # => "oof"
    #
    #   @param [Object] value
    #   @param [Proc] fn
    #
    #   @return [Object]
    #
    # @overload execute(hash, fn, keys)
    #   Executes a function with values under given keys of the hash
    #
    #   @example
    #     fn = Functions[:execute, -> v { v.reverse }, [:foo]]
    #     fn[{ foo: "FOO" }] # => "OOF"
    #
    #   @param [Hash] hash
    #   @param [Proc] fn
    #   @param [Object, Array<Object>] keys
    #
    #   @return [Object]
    #
    def self.execute(value, fn, keys = nil)
      args =
        if keys.nil?
          value
        elsif keys.instance_of? Array
          value.values_at(*keys)
        else
          value[keys]
        end
      fn.call(args)
    end

  end # module Functions

end # module Faceter
