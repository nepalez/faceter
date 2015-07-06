module Faceter

  module Nodes

    # The node describes adding prefix from tuples' keys
    #
    # @api private
    #
    class AddPrefix < AbstractMapper::Node

      # @!scope class
      # @!method new(prefix, options)
      # Creates the node
      #
      # @example
      #   AddPrefix.new "user", separator: ".", nested: true
      #
      # @param [#to_s] prefix The prefix to be added to keys
      # @param [Hash] options
      #
      # @option options [#to_s] :separator ("_")
      # @option options [Boolean] :nested (false)
      #   Whether the prefix should be added deeply
      # @option (see Faceter::Functions.reverse)
      #
      # @return [Faceter::Nodes::AddPrefix]

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
        Functions[:map_keys, __filtered__]
      end

      def __filtered__
        Functions[:guard, Functions[:check, @options], __function__]
      end

      def __function__
        Functions[:keep_symbol, Functions[:add_prefix, @prefix, @separator]]
      end

    end # class AddPrefix

  end # module Nodes

end # module Faceter
