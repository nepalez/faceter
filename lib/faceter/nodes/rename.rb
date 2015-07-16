module Faceter

  module Nodes

    # The node describes renaming a key of tuples
    #
    # @api private
    #
    class Rename < AbstractMapper::Node

      # @!scope class
      # @!method new(hash)
      # Creates the node
      #
      # @example
      #   Rename.new(bar: :foo, baz: :qux)
      #
      # @param [Hash] hash List of renamings
      #
      # @return [Faceter::Nodes::Rename]

      # @private
      def initialize(hash)
        @hash = hash
        super
      end

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:rename_keys, @hash]
      end

    end # class Rename

  end # module Nodes

end # module Faceter
