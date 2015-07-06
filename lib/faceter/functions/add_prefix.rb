# encoding: utf-8

module Faceter

  module Functions

    # Adds the prefix with separator to the string
    #
    # @example
    #   fn = Functions[:add_prefix, "foo", "."]
    #   fn["bar"] # => "foo.bar"
    #
    # @param [#to_s] string
    # @param [#to_s] prefix
    # @param [#to_s] separator
    #
    # @return [String]
    #
    def self.add_prefix(string, prefix, separator)
      "#{prefix}#{separator}#{string}"
    end

  end # module Functions

end # module Faceter
