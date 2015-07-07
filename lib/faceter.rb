# encoding: utf-8

require "abstract_mapper"

# Load specific transformations
require_relative "faceter/functions"
require_relative "faceter/functions/sub"
require_relative "faceter/functions/reverse"
require_relative "faceter/functions/split"
require_relative "faceter/functions/check"
require_relative "faceter/functions/keep_symbol"
require_relative "faceter/functions/transform_hash"
require_relative "faceter/functions/add_prefix"
require_relative "faceter/functions/drop_prefix"
require_relative "faceter/functions/execute"
require_relative "faceter/functions/merge"

# Load specific AST nodes
require_relative "faceter/nodes/list"
require_relative "faceter/nodes/field"
require_relative "faceter/nodes/add_prefix"
require_relative "faceter/nodes/remove_prefix"
require_relative "faceter/nodes/stringify_keys"
require_relative "faceter/nodes/symbolize_keys"
require_relative "faceter/nodes/create"
require_relative "faceter/nodes/exclude"
require_relative "faceter/nodes/rename"
require_relative "faceter/nodes/fold"
require_relative "faceter/nodes/unfold"

# ROM-compatible data mapper
#
module Faceter

end # module Faceter
