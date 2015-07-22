# encoding: utf-8

module Faceter

  module Functions

    # Splits the hash into two parts, where the first one is defined
    # by options, while the second contains the rest of the source
    #
    # @example
    #   source = { foo: :FOO, bar: :BAR, baz: :BAZ }
    #   fn = Functions[:split, except: :bar]
    #   fn[source] => [{ foo: :FOO, baz: :BAZ }, { bar: :BAR }]
    #
    # @param [Hash] hash
    # @param [Hash] options
    #
    # @option options (see Faceter::Functions.reverse)
    #
    # @return [Array<Hash>]
    #
    def self.split(hash, options = {})
      selector = Selector.new(options)
      fn = -> key, _ { selector[key] }
      [hash.select(&fn), hash.reject(&fn)]
    end

  end # module Functions

end # module Faceter
