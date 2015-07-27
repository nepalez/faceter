# encoding: utf-8

require "abstract_mapper"
require "selector"

# Load specific transformations
require_relative "faceter/functions"
require_relative "faceter/functions/split"
require_relative "faceter/functions/exclude"
require_relative "faceter/functions/keep_symbol"
require_relative "faceter/functions/add_prefix"
require_relative "faceter/functions/drop_prefix"
require_relative "faceter/functions/clean"
require_relative "faceter/functions/wrap"
require_relative "faceter/functions/unwrap"
require_relative "faceter/functions/group"
require_relative "faceter/functions/ungroup"
require_relative "faceter/functions/claster"

# Load specific AST nodes
require_relative "faceter/nodes/list"
require_relative "faceter/nodes/field"
require_relative "faceter/nodes/change_prefix"
require_relative "faceter/nodes/add_prefix"
require_relative "faceter/nodes/remove_prefix"
require_relative "faceter/nodes/stringify_keys"
require_relative "faceter/nodes/symbolize_keys"
require_relative "faceter/nodes/create"
require_relative "faceter/nodes/exclude"
require_relative "faceter/nodes/rename"
require_relative "faceter/nodes/fold"
require_relative "faceter/nodes/unfold"
require_relative "faceter/nodes/wrap"
require_relative "faceter/nodes/unwrap"
require_relative "faceter/nodes/group"
require_relative "faceter/nodes/ungroup"

# Load specific optimization rules
require_relative "faceter/rules/prepend_nested"
require_relative "faceter/rules/append_nested"
require_relative "faceter/rules/order_fields"
require_relative "faceter/rules/merge_branches"
require_relative "faceter/rules/merge_renames"
require_relative "faceter/rules/merge_excludes"

# Load the gem-specific base mapper
require_relative "faceter/coercers"
require_relative "faceter/mapper"

# ROM-compatible data mapper
#
module Faceter

end # module Faceter
