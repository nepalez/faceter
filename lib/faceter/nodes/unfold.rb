module Faceter

  module Nodes

    # The node describes exclusion of the field from a tuple
    #
    # @api private
    #
    class Unfold < AbstractMapper::Node

      attribute :key

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[-> hash { hash[key] }]
      end

    end # class Unfold

  end # module Nodes

end # module Faceter
