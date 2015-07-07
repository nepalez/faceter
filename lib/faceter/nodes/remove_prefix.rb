module Faceter

  module Nodes

    # The node describes removing prefix from tuples' keys
    #
    # @api private
    #
    class RemovePrefix < AbstractMapper::Node

      # @!scope class
      # @!method new(prefix, options)
      # Creates the node
      #
      # @example
      #   RemovePrefix.new "user", separator: ".", nested: true
      #
      # @param [#to_s] prefix The prefix to be excluded
      # @param [Hash] options
      #
      # @option (see Faceter::Nodes::AddPrefix.new)
      #
      # @return [Faceter::Nodes::RemovePrefix]

      # @private
      def initialize(prefix, **options)
        @prefix    = prefix
        @options   = options
        @separator = options.fetch(:separator) { "_" }
        @nested    = options[:nested]
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
        Functions[:map_keys, __filtered____]
      end

      def __filtered____
        Functions[:guard, Functions[:check, @options], __function__]
      end

      def __function__
        Functions[:keep_symbol, Functions[:drop_prefix, @prefix, @separator]]
      end

    end # class RemovePrefix

  end # module Nodes

end # module Faceter
