module Faceter

  module Nodes

    # The node describes exclusion of the field from a tuple
    #
    # @api private
    #
    class Fold < AbstractMapper::Node

      # @!scope class
      # @!method new(options)
      # Creates the node
      #
      # @example
      #   Fold.new to: 'foo'
      #
      # @param [Hash] options
      # @option options [Object] :to The key for value fo fold under
      #
      # @return [Faceter::Nodes::Fold]

      # @private
      def initialize(**options)
        @key = options.fetch(:to)
        super
      end

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[-> value { { @key => value } }]
      end

    end # class Fold

  end # module Nodes

end # module Faceter
