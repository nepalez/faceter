module Faceter

  module Nodes

    # The node describes stringifying keys of tuple (and its nested tuples)
    #
    # @api private
    #
    class StringifyKeys < AbstractMapper::Node

      # @!scope class
      # @!method new(options)
      # Creates the node
      #
      # @example
      #   StringifyKeys.new nested: false
      #
      # @param [Hash] options
      #
      # @option options [Boolean] :nested (true)
      #   Whether keys should be stringified deeply
      # @option (see Faceter::Functions.reverse)
      #
      # @return [Faceter::Nodes::StringifyKeys]

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

      def __function__
        -> key { key.to_s }
      end

    end # class StringifyKeys

  end # module Nodes

end # module Faceter
