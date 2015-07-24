module Faceter

  module Nodes

    # The node describes unwrapping values from the nested tuples
    #
    # @api private
    #
    class Unwrap < AbstractMapper::Node

      attribute :key
      attribute :selector

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:unwrap, key, selector]
      end

    end # class Unwrap

  end # module Nodes

end # module Faceter
