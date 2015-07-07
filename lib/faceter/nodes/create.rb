module Faceter

  module Nodes

    # The node describes creating a new value from values by keys
    #
    # @api private
    #
    class Create < AbstractMapper::Node

      # @!scope class
      # @!method new(name = nil, options, &block)
      # Creates the node
      #
      # @example
      #   Create.new :foo, from: [:bar, :baz] do |bar, baz|
      #     bar + baz
      #   end
      #
      # @param [Object] name The optional name for the new key
      #   When skipped, the resulting value will rewrite the whole tuple
      # @param [Hash] options
      # @param [Proc] block The block that coerces a value
      #
      # @option options [nil, Object, Array] :from (nil)
      #   The key, of list of keys, from which values should be taken
      #   When skipped, the whole tuple will be send to the block
      #
      # @yieldparam
      #   Either the list of values by given keys, or the whole tuple
      #
      # @return [Faceter::Nodes::Create]

      # @private
      def initialize(name = nil, **options, &block)
        @name    = name
        @coercer = block_given? ? block : Functions[:identity]
        @keys    = options.fetch(:from)
        super
      end

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        function = Functions[:execute, @coercer, @keys]
        Functions[:merge, function, @name]
      end

    end # class Create

  end # module Nodes

end # module Faceter
