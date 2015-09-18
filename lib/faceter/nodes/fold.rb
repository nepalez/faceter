module Faceter

  module Nodes

    # The node describes exclusion of the field from a tuple
    #
    # @api private
    #
    class Fold < AbstractMapper::AST::Node

      attribute :key

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[-> value { { key => value } }]
      end

    end # class Fold

  end # module Nodes

end # module Faceter
