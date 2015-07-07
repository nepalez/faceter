module Faceter

  module Nodes

    # The node describes exclusion of the field from a tuple
    #
    # @api private
    #
    class Unfold < AbstractMapper::Node

      # @!scope class
      # @!method new(options)
      # Creates the node
      #
      # @example
      #   Unfold.new from: 'foo'
      #
      # @param [Hash] options
      # @option options [Object] :from The key whose value should be unfolded
      #
      # @return [Faceter::Nodes::Unfold]

      # @private
      def initialize(**options)
        @key = options.fetch(:from)
        super
      end

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[-> hash { hash[@key] }]
      end

    end # class Unfold

  end # module Nodes

end # module Faceter
