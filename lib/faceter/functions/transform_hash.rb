# encoding: utf-8

module Faceter

  module Functions

    # Applies the transformation to the hash (and skips non-hashes)
    #
    # If a second argument is set to true, does it recursively for
    # nested levels of data
    #
    # @example
    #   transformer = -> hash { hash.reject { |k, _| k == :foo } }
    #
    #   fn = Functions[:transform_hash, true, transformer]
    #   fn[{ foo: :FOO, bar: [{ foo: :FOO, bar: :BAR }] }]
    #   # => { bar: [{ bar: :BAR }] }
    #
    # @param [Object] hash
    # @param [Boolean] nested
    # @param [Transproc::Function] fn The transformation to be applied to hash
    #
    # @return [Object] transformed hash
    #
    def self.transform_hash(hash, nested, fn)
      function = t(:is, Hash, fn)
      function = t(:recursion, function) if nested
      function[hash]
    end

  end # module Functions

end # module Faceter
