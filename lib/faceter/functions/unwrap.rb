# encoding: utf-8

module Faceter

  module Functions

    # Partially unwraps a subhash under the hash key following the options
    #
    # @example
    #   fn = Functions[:unwrap, :foo, only: :bar]
    #   fn[foo: { bar: :BAR, baz: :BAZ }, qux: :QUX]
    #   # => { qux: :QUX, foo: { baz: :BAZ }, bar: :BAR }
    #
    # @param [Hash] hash
    # @param [Object] key
    # @param [Hash] options
    #
    # @option (see Faceter::Functions.reverse)
    #
    # @return Hash
    #
    def self.unwrap(hash, key, options = {})
      extracted, keep = split hash.fetch(key, {}), options
      clean_hash = clean(hash.merge(key => keep), key)
      clean_hash.merge(extracted)
    end

  end # module Functions

end # module Faceter
