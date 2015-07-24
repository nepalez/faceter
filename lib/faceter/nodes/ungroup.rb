module Faceter

  module Nodes

    # The node describes grouping fields from nested arrays to tuples
    #
    # @api private
    #
    class Ungroup < AbstractMapper::Node

      attribute :key
      attribute :selector

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:ungroup, key, selector]
      end

    end # class Ungroup

  end # module Nodes

end # module Faceter
