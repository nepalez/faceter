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
    class ChangePrefix < AbstractMapper::Node

      # @!attribute [r] nested
      #
      # @return [Boolean] Whether the transformation applied to nested levels
      #
      attr_reader :nested

      # @private
      def initialize(prefix, **options)
        @prefix    = prefix
        @options   = options
        @separator = options.fetch(:separator) { "_" }
        @nested    = options.fetch(:nested) { false }
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

      def __function__
        Functions[:keep_symbol, Functions[__operation__, @prefix, @separator]]
      end

    end # class AddPrefix

  end # module Nodes

end # module Faceter
