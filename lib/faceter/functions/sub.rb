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

      return t(:accept_keys, Array[*whitelist])[hash] if whitelist
      t(:reject_keys, Array[*blacklist])[hash]
    end

  end # module Functions

end # module Faceter
