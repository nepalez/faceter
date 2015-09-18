module Faceter

  module Nodes

    # The composed node that describes a field of tuples in input data
    #
    # @api private
    #
    class Field < AbstractMapper::AST::Branch

      attribute :key

      # Builds a transproc function for the field node from its child nodes
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:map_value, key, super]
      end

    end # class Field

  end # module Nodes

end # module Faceter
