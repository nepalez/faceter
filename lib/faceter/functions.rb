# encoding: utf-8

require "transproc/conditional"
require "transproc/hash"
require "transproc/array"
require "transproc/recursion"
require "transproc/coercions"

module Faceter

  # Collection of the gem-specific transformations (pure functions)
  #
  # @api private
  #
  module Functions

    extend Transproc::Registry

    import Transproc::HashTransformations
    import Transproc::ArrayTransformations

    import :guard,     from: Transproc::Conditional
    import :identity,  from: AbstractMapper::Functions
    import :is,        from: Transproc::Conditional
    import :recursion, from: Transproc::Recursion
    import :to_tuples, from: Transproc::Coercions

  end # module Functions

end # module Faceter
