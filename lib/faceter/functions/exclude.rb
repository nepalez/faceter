# encoding: utf-8

module Faceter

  module Functions

    # Excludes keys from hash following options
    #
    # @example
    #   source = { foo: :FOO, bar: :BAR, baz: :BAZ }
    #
    #   Functions[:exclude, except: :bar][source]
    #   # => { bar: :BAR }
    #
    #   Functions[:exclude, only: :bar][source]
    #   # => { foo: :FOO, baz: :BAZ }
    #
    # @param [Hash] hash
    # @param [Hash] options
    #
    # @option options (see Faceter::Functions.reverse)
    #
    # @return [Array<Hash>]
    #
    def self.exclude(hash, options = {})
      selector = Selector.new(options)
      hash.reject { |key, _| selector[key] }
    end

  end # module Functions

end # module Faceter
