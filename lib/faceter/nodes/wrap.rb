module Faceter

  module Nodes

    # The node describes wrapping values or parts of hashes into nested tuples
    #
    # @api private
    #
    class Wrap < AbstractMapper::Node

      # @!scope class
      # @!method new(*keys, options)
      # Creates the node
      #
      # @example
      #   Wrap.new to: :foo, only: [:bar, :baz]
      #
      # @param [Object, Array] keys The key or list of keys to be wrapped
      # @param [Hash] options
      #
      # @option options [Object] :to The key of the updated/created field
      # @option (see Faceter::Functions.reverse)
      #
      # @return [Faceter::Nodes::Wrap]

      # @private
      def initialize(*keys, **options)
        @options = (keys.any? ? { only: keys } : {}).update(options)
        @key     = options.fetch(:to)
        super
      end

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:wrap, @key, @options]
      end

    end # class Wrap

  end # module Nodes

end # module Faceter
