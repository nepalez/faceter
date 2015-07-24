# encoding: utf-8

module Faceter

  # The base class for mappers
  #
  # @api private
  #
  class Mapper < AbstractMapper
    configure do

      # List of mapper commands
      command :add_prefix, Nodes::AddPrefix do |prefix, **options|
        separator = options.fetch(:separator) { "_" }
        nested    = options.fetch(:nested) { false }
        selector  = Selector.new(options) if options[:except] || options[:only]
        { prefix: prefix, separator: separator, nested: nested, selector: selector }
      end

      command :create, Nodes::Create do |name, **options|
        { name: name, keys: options[:from] }
      end

      command :exclude, Nodes::Exclude do |*keys, **options|
        opts = keys.any? ? { only: keys } : options
        { selector: Selector.new(opts) }
      end

      command :field, Nodes::Field do |key|
        { key: key }
      end

      command :fold, Nodes::Fold do |**options|
        { key: options.fetch(:to) }
      end

      command :group, Nodes::Group do |*keys, **options|
        key = options.fetch(:to)
        opts = (keys.any? ? { only: keys } : {}).merge(options)
        { key: key, selector: Selector.new(opts) }
      end

      command :list, Nodes::List

      command :remove_prefix, Nodes::RemovePrefix do |prefix, **options|
        separator = options.fetch(:separator) { "_" }
        nested    = options.fetch(:nested) { false }
        selector  = Selector.new(options) if options[:except] || options[:only]
        { prefix: prefix, separator: separator, nested: nested, selector: selector }
      end

      command :rename, Nodes::Rename do |name, **options|
        { keys: { name => options.fetch(:to) } }
      end

      command :stringify_keys, Nodes::StringifyKeys

      command :symbolize_keys, Nodes::SymbolizeKeys

      command :unfold, Nodes::Unfold do |options|
        { key: options.fetch(:from) }
      end

      command :ungroup, Nodes::Ungroup do |*keys, **options|
        key = options.fetch(:from)
        opts = (keys.any? ? { only: keys } : {}).merge(options)
        { key: key, selector: Selector.new(opts) }
      end

      command :unwrap, Nodes::Unwrap do |*keys, **options|
        key = options.fetch(:from)
        opts = (keys.any? ? { only: keys } : {}).merge(options)
        { key: key, selector: Selector.new(opts) }
      end

      command :wrap, Nodes::Wrap do |*keys, **options|
        key = options.fetch(:to)
        opts = (keys.any? ? { only: keys } : {}).merge(options)
        { key: key, selector: Selector.new(opts) }
      end

      # List of optimization rules
      rule Rules::PrependNested
      rule Rules::AppendNested
      rule Rules::MergeBranches
      rule Rules::MergeRenames

    end
  end # class Mapper

end # module Faceter
