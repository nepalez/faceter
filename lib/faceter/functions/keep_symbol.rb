# encoding: utf-8

module Faceter

  module Functions

    # Applies the function to the source and converts the result to symbol
    # if the source data was a symbol.
    #
    # @example
    #   fn = Functions[:keep_symbol, -> v { v.to_s.reverse }]
    #   fn["123"] # => "321"
    #   fn[:123]  # => :321
    #
    # @param [Object] source
    # @param [Transproc::Function] fn
    #
    # @return [String, Symbol]
    #
    def self.keep_symbol(source, fn)
      data = fn.call(source)
      source.instance_of?(Symbol) ? data.to_s.to_sym : data
    end

  end # module Functions

end # module Faceter
