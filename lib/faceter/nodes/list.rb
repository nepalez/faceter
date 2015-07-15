module Faceter

  # The collection of faceter-specific nodes of the AST
  #
  module Nodes

    # The composed node that describes an array of the input data
    #
    # @api private
    #
    class List < AbstractMapper::Branch

      # @private
      def initialize
        super
      end

      # Builds a transproc function for the node from its child nodes
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:map_array, super]
      end

    end # class List

  end # module Nodes

end # module Faceter
