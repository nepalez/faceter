module Faceter

  module Nodes

    # The node describes exclusion of the field from a tuple
    #
    # @api private
    #
    class Exclude < Optional

      # @!scope class
      # @!method new(*keys)
      # Creates the node
      #
      # @example
      #   Exclude.new :bar, :baz
      #
      # @param [Object, Array] keys The key or list of keys to be excluded
      # @param [Hash] options
      #
      # @option (see Faceter::Functions.reverse)
      #
      # @return [Faceter::Nodes::Exclude]

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:exclude, @options]
      end

    end # class Exclude

  end # module Nodes

end # module Faceter
