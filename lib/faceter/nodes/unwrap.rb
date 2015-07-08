module Faceter

  module Nodes

    # The node describes unwrapping values from the nested tuples
    # either fully or partially.
    #
    # @api private
    #
    class Unwrap < AbstractMapper::Node

      # @!scope class
      # @!method new(*keys, options)
      # Creates the node
      #
      # @example
      #   Unwrap.new from: :foo, only: [:bar, :baz]
      #   Unwrap.new from: :foo, except: :qux
      #
      # @param [Object, Array] keys The key, or list of keys to be unwrapped
      # @param [Hash] options
      #
      # @option options [Object] :from The key to unwrap values from
      # @option (see Faceter::Functions.reverse)
      #
      # @return [Faceter::Nodes::Unwrap]

      # @private
      def initialize(*keys, **options)
        @options = (keys.any? ? { only: keys } : {}).update(options)
        @key     = options.fetch(:from)
        super
      end

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:unwrap, @key, @options]
      end

    end # class Unwrap

  end # module Nodes

end # module Faceter
