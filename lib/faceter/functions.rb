# encoding: utf-8

require "transproc/conditional"
require "transproc/hash"
require "transproc/array"

module Faceter

  # Collection of the gem-specific transformations (pure functions)
  #
  # @api private
  #
  module Functions

    extend Transproc::Registry

    import Transproc::HashTransformations
    import Transproc::ArrayTransformations

  end # module Functions

end # module Faceter
