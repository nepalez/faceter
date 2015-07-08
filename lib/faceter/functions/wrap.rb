# encoding: utf-8

module Faceter

  module Functions

    # Partially wraps a subhash into the new key following the options
    #
    # @example
    #   fn = Functions[:wrap, :foo, only: :bar]
    #   fn[foo: { baz: :BAZ }, bar: :BAR, qux: :QUX]
    #   # => { foo: { baz: :BAZ, bar: :BAR }, qux: :QUX }
    #
    # @param [Hash] hash
    # @param [Object] key
    # @param [Hash] options
    #
    # @option (see Faceter::Functions.reverse)
    #
    # @return Hash
    #
    def self.wrap(hash, key, options = {})
      to_wrap, to_keep = split hash, options
      wrapped = to_keep[key]

      to_wrap = wrapped.merge(to_wrap) if wrapped.instance_of? Hash
      to_keep.merge(key => to_wrap)
    end

  end # module Functions

end # module Faceter
