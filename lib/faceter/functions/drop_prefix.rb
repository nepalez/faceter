# encoding: utf-8

module Faceter

  module Functions

    # Removes the prefix with separator from the string
    #
    # @example
    #   fn = Functions[:drop_prefix, "foo", "."]
    #   fn["foo.bar"]  # => "bar"
    #
    # @param [#to_s] string
    # @param [#to_s] prefix
    # @param [#to_sl] separator
    #
    # @return [String]
    #
    def self.drop_prefix(string, prefix, separator)
      str   = string.to_s
      affix = "#{prefix}#{separator}"
      first = str.start_with?(affix) ? affix.length : 0

      str[first..-1]
    end

  end # module Functions

end # module Faceter
