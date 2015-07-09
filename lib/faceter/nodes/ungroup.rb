module Faceter

  module Nodes

    # The node describes grouping fields from nested arrays to tuples
    #
    # @api private
    #
    class Ungroup < Optional

      # @!scope class
      # @!method new(*keys, options)
      # Creates the node
      #
      # @example
      #   Ungroup.new :bar, :baz, from: :foo
      #
      # @param [Object, Array] keys The key or list of keys to be grouped
      # @param [Hash] options
      #
      # @option options [Object] :from The key to ungroup fields from
      # @option (see Faceter::Functions.reverse)
      #
      # @return [Faceter::Nodes::Ungroup]

      # @private
      def initialize(*keys, **options)
        @key = options.fetch(:from)
        super
      end

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:ungroup, @key, @options]
      end

    end # class Ungroup

  end # module Nodes

end # module Faceter
