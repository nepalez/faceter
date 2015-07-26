# encoding: utf-8

module Faceter

  # The base class for mappers
  #
  # @api private
  #
  class Mapper < AbstractMapper
    configure do

      # List of mapper commands
      command :add_prefix,     Nodes::AddPrefix,    &Coercers[:prefix]
      command :create,         Nodes::Create,       &Coercers[:create]
      command :exclude,        Nodes::Exclude,      &Coercers[:exclude]
      command :field,          Nodes::Field,        &Coercers[:field]
      command :fold,           Nodes::Fold,         &Coercers[:fold]
      command :group,          Nodes::Group,        &Coercers[:wrap]
      command :list,           Nodes::List
      command :remove_prefix,  Nodes::RemovePrefix, &Coercers[:prefix]
      command :rename,         Nodes::Rename,       &Coercers[:rename]
      command :stringify_keys, Nodes::StringifyKeys
      command :symbolize_keys, Nodes::SymbolizeKeys
      command :unfold,         Nodes::Unfold,       &Coercers[:unfold]
      command :ungroup,        Nodes::Ungroup,      &Coercers[:unwrap]
      command :unwrap,         Nodes::Unwrap,       &Coercers[:unwrap]
      command :wrap,           Nodes::Wrap,         &Coercers[:wrap]

      # List of optimization rules
      rule Rules::PrependNested
      rule Rules::AppendNested
      rule Rules::MergeBranches
      rule Rules::MergeRenames

    end
  end # class Mapper

end # module Faceter
