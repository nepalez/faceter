module Faceter

  module Nodes

    # The node describes grouping fields from tuples into nested arrays
    #
    # @api private
    #
    class Group < AbstractMapper::Node

      # @!scope class
      # @!method new(*keys, options)
      # Creates the node
      #
      # @example
      #   Group.new :bar, :baz, to: :foo
      #
      # @param [Object, Array] keys The key or list of keys to be grouped
      # @param [Hash] options
      #
      # @option options [Object] :to The name of the created/updated group
      # @option (see Faceter::Functions.reverse)
      #
      # @return [Faceter::Nodes::Group]

      # @private
      def initialize(*keys, **options)
        @options = (keys.any? ? { only: keys } : {}).update(options)
        @key = options.fetch(:to)
        super
      end

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:group, @key, @options]
      end

    end # class Group

  end # module Nodes

end # module Faceter
