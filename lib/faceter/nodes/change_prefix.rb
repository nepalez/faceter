module Faceter

  module Nodes

    # The base class for prefix-manipulating nodes
    #
    # see [Faceter::Nodes::AddPrefix]
    # see [Faceter::Nodes::RemovePrefix]
    #
    # @abstract
    #
    # @api private
    #
    class ChangePrefix < AbstractMapper::AST::Node

      attribute :prefix
      attribute :separator, default: "_"
      attribute :nested, default: false
      attribute :selector

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        return __transformation__ unless nested
        Functions[:recursion, Functions[:is, Hash, __transformation__]]
      end

      private

      def __transformation__
        Functions[:map_keys, __selected__]
      end

      def __selected__
        return __function__ unless selector
        Functions[:guard, selector, __function__]
      end

      def __function__
        Functions[:keep_symbol, Functions[__operation__, prefix, separator]]
      end

      # __operation__ should be defined in a specific node

    end # class AddPrefix

  end # module Nodes

end # module Faceter
