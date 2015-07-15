module Faceter

  module Nodes

    # The base class for nodes, describing stringifying or symbolizing keys
    #
    # see [Faceter::Nodes::StringifyKeys]
    # see [Faceter::Nodes::SymbolizeKeys]
    #
    # @abstract
    #
    # @api private
    #
    class TransformKeys < AbstractMapper::Node

      # @!attribute [r] nested
      #
      # @return [Boolean] Whether the transformation applied to nested levels
      #
      attr_reader :nested

      # @private
      def initialize(**options)
        @options = options
        @nested  = options.fetch(:nested) { true }
        super
      end

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:transform_hash, @nested, __transformation__]
      end

      private

      def __transformation__
        Functions[:map_keys, __filtered__]
      end

      def __filtered__
        Functions[:guard, Functions[:check, @options], __function__]
      end

    end # class StringifyKeys

  end # module Nodes

end # module Faceter
