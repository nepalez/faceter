# encoding: utf-8

module Faceter

  module Functions

    # Returns a subhash with keys, defined by options
    #
    # @example
    #   source = { foo: :FOO, bar: :BAR }
    #
    #   fn = Functions[:subhash]
    #   fn[source] # => { foo: :FOO, bar: :BAR }
    #
    #   fn = Functions[:subhash, only: [:foo]]
    #   fn[source] # => { foo: :FOO }
    #
    #   fn = Functions[:subhash, except: [:foo]]
    #   fn[source] # => { bar: :BAR }
    #
    # @param [Hash] hash
    # @param (see Faceter::Functions.reverse)
    #
    # @return [Hash]
    #
    def self.sub(hash, options = {})
      whitelist = options.fetch(:only, nil)
      blacklist = options.fetch(:except, nil)

      return accept_keys(hash, Array[*whitelist]) if whitelist
      reject_keys(hash, Array[*blacklist])
    end

  end # module Functions

end # module Faceter
