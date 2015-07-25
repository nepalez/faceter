module Faceter

  module Nodes

    # The node describes renaming a key of tuples
    #
    # @api private
    #
    class Rename < AbstractMapper::Node

      attribute :keys, default: {}

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:rename_keys, keys]
      end

    end # class Rename

  end # module Nodes

end # module Faceter
