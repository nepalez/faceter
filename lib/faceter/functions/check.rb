# encoding: utf-8

module Faceter

  module Functions

    # Checks if the value satisfies restrictions
    #
    # @example
    #   fn = Functions[:check, only: /foo/, except: "foo"]
    #   fn[:foo]  # => true
    #   fn["foo"] # => false
    #
    # @param [Object] value The value to be checket agaist the options
    # @param [Hash] options ({})
    #
    # @option options [Object, Array] :only
    #   The white list of applicable keys
    # @option options [Object, Array] :except
    #   The black list of applicable keys
    #
    # @option (see Faceter::Functions.reverse)
    #
    # @return [Boolean]
    #
    def self.check(value, options = {})
      Selector.new(options)[value]
    end

  end # module Functions

end # module Faceter
