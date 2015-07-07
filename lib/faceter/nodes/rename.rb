module Faceter

  module Nodes

    # The node describes renaming a key of tuples
    #
    # @api private
    #
    class Rename < AbstractMapper::Node

      # @!scope class
      # @!method new(key, options)
      # Creates the node
      #
      # @example
      #   Rename.new :bar, to: :foo
      #
      # @param [Object] key The old name of the field to be renamed
      # @param [Hash] options
      #
      # @option options [Object] :to The new name of the field
      #
      # @return [Faceter::Nodes::Rename]

      # @private
      def initialize(key, **options)
        @key  = key
        @name = options.fetch(:to)
        super
      end

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:rename_keys, @key => @name]
      end

    end # class Rename

  end # module Nodes

end # module Faceter
