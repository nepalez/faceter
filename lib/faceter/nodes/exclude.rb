module Faceter

  module Nodes

    # The node describes exclusion of the field from a tuple
    #
    # @api private
    #
    class Exclude < AbstractMapper::Node

      attribute :selector, Selector::Condition

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
