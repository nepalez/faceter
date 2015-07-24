module Faceter

  module Nodes

    # The node describes wrapping hash values into nested tuple
    #
    # @api private
    #
    class Wrap < AbstractMapper::Node

      attribute :key
      attribute :selector

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:wrap, key, selector]
      end

    end # class Wrap

  end # module Nodes

end # module Faceter
