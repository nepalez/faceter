# encoding: utf-8

require "abstract_mapper"

# Load specific transformations
require_relative "faceter/functions"
require_relative "faceter/functions/sub"
require_relative "faceter/functions/reverse"
require_relative "faceter/functions/split"

# Load specific AST nodes
require_relative "faceter/nodes/list"
require_relative "faceter/nodes/field"

# ROM-compatible data mapper
#
module Faceter

end # module Faceter
