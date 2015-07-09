module Faceter

  module Nodes

    # The node describes stringifying keys of tuple (and its nested tuples)
    #
    # @api private
    #
    class StringifyKeys < TransformKeys

      # @!scope class
      # @!method new(options)
      # Creates the node
      #
      # @example
      #   StringifyKeys.new nested: false
      #
      # @param [Hash] options
      #
      # @option options [Boolean] :nested (true)
      #   Whether keys should be stringified deeply
      # @option (see Faceter::Functions.reverse)
      #
      # @return [Faceter::Nodes::StringifyKeys]

      private

      def __function__
        -> key { key.to_s }
      end

    end # class StringifyKeys

  end # module Nodes

end # module Faceter
