module Faceter

  module Nodes

    # The node describes grouping fields from tuples into nested arrays
    #
    # @api private
    #
    class Group < AbstractMapper::AST::Node

      attribute :key
      attribute :selector

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:group, key, selector]
      end

    end # class Group

  end # module Nodes

end # module Faceter
