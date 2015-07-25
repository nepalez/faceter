module Faceter

  module Nodes

    # The node describes exclusion of the field from a tuple
    #
    # @api private
    #
    class Exclude < AbstractMapper::Node

      attribute :selector

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:exclude, selector]
      end

    end # class Exclude

  end # module Nodes

end # module Faceter
