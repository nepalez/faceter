module Faceter

  module Nodes

    # The node describes stringifying keys of tuple (and its nested tuples)
    #
    # @api private
    #
    class SymbolizeKeys < AbstractMapper::AST::Node

      attribute :nested, default: true

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        fn = Functions[:symbolize_keys]
        nested ? Functions[:recursion, Functions[:is, Hash, fn]] : fn
      end

    end # class SymbolizeKeys

  end # module Nodes

end # module Faceter
