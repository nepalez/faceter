# encoding: utf-8

module Faceter

  module Functions

    # Checks if a key satisfies restrictions that are set by options
    #
    # @example
    #   fn = Functions[:check, only: [:foo, :bar]]
    #   fn[:foo]  # => true
    #   fn["foo"] # => false
    #
    # @param [Object] key The key to be checket agaist the options
    # @param [Hash] options
    #
    # @option (see Faceter::Functions.reverse)
    #
    # @return [Boolean]
    #
    def self.check(key, options = {})
      whitelist = options[:only]
      blacklist = options[:except]

      return Array[*whitelist].include?(key) if whitelist
      !Array[*blacklist].include?(key)
    end

  end # module Functions

end # module Faceter
