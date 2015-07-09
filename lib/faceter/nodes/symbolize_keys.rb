module Faceter

  module Nodes

    # The node describes stringifying keys of tuple (and its nested tuples)
    #
    # @api private
    #
    class SymbolizeKeys < TransformKeys

      # @!scope class
      # @!method new(options)
      # Creates the node
      #
      # @example
      #   SymbolizeKeys.new nested: false, only: %w(foo bar)
      #
      # @param [Hash] options
      #
      # @option options [Boolean] :nested (true)
      #   Whether keys should be symbolized deeply
      # @option (see Faceter::Functions.reverse)
      #
      # @return [Faceter::Nodes::SymbolizeKeys]

      private

      def __function__
        -> key { key.to_s.to_sym }
      end

    end # class SymbolizeKeys

  end # module Nodes

end # module Faceter
