# encoding: utf-8

module Faceter

  # The base class for mappers
  #
  # @api private
  #
  class Mapper < AbstractMapper
    configure do

      # List of mapper commands
      command :add_prefix,     Nodes::AddPrefix
      command :create,         Nodes::Create
      command :exclude,        Nodes::Exclude
      command :field,          Nodes::Field
      command :fold,           Nodes::Fold
      command :group,          Nodes::Group
      command :list,           Nodes::List
      command :remove_prefix,  Nodes::RemovePrefix
      command :rename,         Nodes::Rename
      command :stringify_keys, Nodes::StringifyKeys
      command :symbolize_keys, Nodes::SymbolizeKeys
      command :unfold,         Nodes::Unfold
      command :ungroup,        Nodes::Ungroup
      command :unwrap,         Nodes::Unwrap
      command :wrap,           Nodes::Wrap

    end
  end # class Mapper

end # module Faceter