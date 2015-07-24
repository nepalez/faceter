# encoding: utf-8

module Faceter

  module Functions

    # Partially unwraps a subhash under the hash key following the selector
    #
    # @example
    #   selector = Selector.new(only: :bar)
    #   function = Functions[:unwrap, :foo, selector]
    #
    #   function[foo: { bar: :BAR, baz: :BAZ }, qux: :QUX]
    #   # => { qux: :QUX, foo: { baz: :BAZ }, bar: :BAR }
    #
    # @param [Hash] hash
    # @param [Object] key
    # @param [Selector::Condition] selector
    #
    # @return Hash
    #
    def self.unwrap(hash, key, selector)
      extracted, keep = split(hash.fetch(key, {}), selector)
      cleaner = Selector.new(only: key)

      clean_hash = clean(hash.merge(key => keep), cleaner)
      clean_hash.merge(extracted)
    end

  end # module Functions

end # module Faceter
