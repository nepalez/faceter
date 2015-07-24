module Faceter

  module Nodes

    # The node describes stringifying keys of tuple (and its nested tuples)
    #
    # @api private
    #
    class StringifyKeys < AbstractMapper::Node

      attribute :nested, Boolean, default: true

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        fn = Functions[:stringify_keys]
        nested ? Functions[:recursion, Functions[:is, Hash, fn]] : fn
      end

    end # class StringifyKeys

  end # module Nodes

end # module Faceter
